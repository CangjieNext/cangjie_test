/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test if timeout parameters of read and write works
 * correctly in tcp serversocket or clientsocket
 * Test API: public override mut prop readTimeout: ?Duration
 *           public override mut prop writeTimeout: ?Duration
 *           public override func read(buffer: Array<Byte>): Int64
 *           public override func write(buffer: Array<Byte>): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var cli = Option<TcpSocket>.None
var data = Array<Byte>(1000, repeat: 55)

@Test
class Test_Tcp_ServerSocket_Timeout {
    func startClient(port: UInt16): Unit {
        var socket = TcpSocket("127.0.0.1", port)
        socket.connect(timeout: 2 * Duration.second)
        cli = Option<TcpSocket>.Some(socket)
    }

    @TestCase
    func test_default_settings(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        spawn {
            startClient(port.load())
        }
        var serversocket = server.accept()
        @Expect(serversocket.readTimeout, Option<Duration>.None)
        @Expect(serversocket.writeTimeout, Option<Duration>.None)
        sleep(Duration.second)
        server.close()
    }

    @TestCase
    func test_set_timeouts_1(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)

        spawn {
            startClient(port.load())
        }
        var serversocket = server.accept()
        serversocket.readTimeout = Duration.second
        serversocket.writeTimeout = 100 * Duration.millisecond
        @Expect(serversocket.readTimeout.getOrThrow(), Duration.second)
        @Expect(serversocket.writeTimeout.getOrThrow(), 100 * Duration.millisecond)

        var buf = Array<Byte>(10000, repeat: 0)
        var sum = 0
        spawn {
            sleep(2 * Duration.second)
            cli.getOrThrow().write(data)
        }
        // do not get data in readtimeout, throw exception
        try {
            serversocket.read(buf)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        sleep(2 * Duration.second)

        spawn {
            sleep(100 * Duration.millisecond)
            cli.getOrThrow().write(data)
        }
        // get data in readtimeout, read data correctly
        var datasize = serversocket.read(buf)
        @Expect(datasize, data.size)
        @Expect(buf[data.size - 1], UInt8(55))
        @Expect(buf[data.size], UInt8(0))
        @Expect(sum, 1)
        server.close()
    }
}
