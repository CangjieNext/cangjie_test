/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the close api in TcpServerSocket or TcpSocket
 * Test API: public mut prop noDelay: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*
import std.collection.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var cli = Option<TcpSocket>.None
var data = Array<Byte>(50, repeat: 10)
var count = AtomicInt64(0)
var arr_fut = ArrayList<Future<Unit>>()
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_Concurrency {
    public override func beforeEach(): Unit {
        bound = AtomicUInt16(0)
    }

    func startServer(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.backlogSize = 1500
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
        var count = 0
        while (count < 40) {
            try {
                var serversocket = server.accept(timeout: 3 * Duration.second)
                serversocket.write(data)
                count += 1
            } catch (e: SocketException | SocketTimeoutException) {
                count += 1
            }
        }
    }

    func startClient(): Unit {
        var client = TcpSocket("127.0.0.1", port.load())
        client.connect(timeout: 10 * Duration.second)
        var readnum = 0
        var buf = Array<Byte>(100, repeat: 0)
        while (readnum < data.size) {
            var readlen = client.read(buf)
            readnum += readlen
        }
        if (data.size == readnum) {
            count.fetchAdd(1)
        }
    }

    @TestCase
    func test_concurrency_1(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        for (_ in 0..40) {
            var fut = spawn {
                startClient()
            }
            arr_fut.add(fut)
        }

        for (fut00 in arr_fut) {
            fut00.get()
        }

        sleep(2 * Duration.second)
        @Expect(count.load(), 40)
        ser.getOrThrow().close()
    }
}
