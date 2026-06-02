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
 * Test description: Test the bindToDevice option in TcpServerSocket
 * Test API: public mut prop bindToDevice: ?String
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_BindToDevice {
    public override func beforeEach(): Unit {
        bound = AtomicUInt16(0)
    }
    func startServer(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
    }

    @TestCase
    func test_bindtodevice(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var clientsocket = TcpSocket("127.0.0.1", port.load())
        @Expect(ser.getOrThrow().bindToDevice, None)

        try {
            ser.getOrThrow().bindToDevice = Some("1235677_none")
            @Expect("", "it's not possible because server is already bound")
        } catch (e: SocketException) {
            @Expect(e.toString().contains("already bound"))
        }
        clientsocket.connect()
        var serversocket = ser.getOrThrow().accept()
        var data = Array<Byte>(100, repeat: 10)
        clientsocket.write(data)
        var sss = serversocket.read(data)
        @Expect(sss, data.size)
        ser.getOrThrow().close()
    }
}
