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
 * Test description: Test the close api in TcpServerSocket or TcpSocket
 * Test API: public mut prop noDelay: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*
import std.posix.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var cli = Option<TcpSocket>.None
var data = Array<Byte>(5, repeat: 10)
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_Close {
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
    func test_close_1(): Unit {
        var server = TcpServerSocket(bindAt: 0)
        server.close()
        @Expect(server.isClosed(), true)

        var socket = TcpSocket("127.0.0.1", 12345)
        socket.close()
        @Expect(socket.isClosed(), true)
    }

    @TestCase
    func test_close_2(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var socket = TcpSocket("127.0.0.1", port.load())
        socket.connect()
        socket.close()
        ser.getOrThrow().close()
        sleep(Duration.second)
        @Expect(ser.getOrThrow().isClosed(), true)
        @Expect(socket.isClosed(), true)
    }

    @TestCase
    func test_close_3(): Unit {
        spawn {
            startServer()
            var serversocket = ser.getOrThrow().accept()
            serversocket.write(data)
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var socket = TcpSocket("127.0.0.1", port.load())
        socket.connect()
        var buf = Array<Byte>(5, repeat: 0)
        var readlen = socket.read(buf)
        socket.close()
        ser.getOrThrow().close()
        sleep(Duration.second)
        @Expect(ser.getOrThrow().isClosed(), true)
        @Expect(socket.isClosed(), true)
        @Expect(readlen, data.size)
        @Expect(buf, data)
    }

    @TestCase
    func test_close_4(): Unit {
        spawn {
            startServer()
            var serversocket = ser.getOrThrow().accept()
            serversocket.write(data)
        }

        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var socket = TcpSocket("127.0.0.1", port.load())
        socket.connect()
        var buf = Array<Byte>(5, repeat: 0)
        var readlen = socket.read(buf)
        socket.close()
        socket.close()
        ser.getOrThrow().close()
        sleep(Duration.second)
        @Expect(ser.getOrThrow().isClosed(), true)
        @Expect(socket.isClosed(), true)
        @Expect(readlen, data.size)
        @Expect(buf, data)
    }

    @TestCase
    func test_close_6(): Unit {
        spawn {
            startServer()
            var serversocket = ser.getOrThrow().accept()
            serversocket.write(data)
        }

        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var socket = TcpSocket("127.0.0.1", port.load())
        socket.connect()
        var buf = Array<Byte>(5, repeat: 0)
        var readlen = socket.read(buf)
        socket.close()
        socket.close()
        ser.getOrThrow().close()
        sleep(Duration.second)
        @Expect(ser.getOrThrow().isClosed(), true)
        @Expect(socket.isClosed(), true)
        @Expect(readlen, data.size)
        @Expect(buf, data)
    }
}
