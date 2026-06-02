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
 * Test description: Test the nodelay option in TcpServerSocket
 * Test API: public mut prop noDelay: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var socket00 = Option<TcpSocket>.None
var data = Array<Byte>(5, repeat: 10)
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_Nodelay {
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

    // test if nodelay close nagle's algorithm when this option is true and only 
    // work in serversocket or clientsocket who set this option true, and open 
    // nagle's algorithm when set to false to receive more packets
    @TestCase
    @Skip
    func test_nodelay_option_1(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var clientsocket = TcpSocket("127.0.0.1", port.load())
        @Expect(clientsocket.noDelay, true)
        clientsocket.connect(timeout: 2 * Duration.second)

        var serversocket = ser.getOrThrow().accept(timeout: Duration.second)
        @Expect(serversocket.noDelay, true)

        // detect nodelay in serversocket
        serversocket.noDelay = false
        clientsocket.noDelay = true // no influence here
        socket00 = Option<TcpSocket>.Some(serversocket)
        spawn {
            sleep(100 * Duration.millisecond)
            for (_ in 0..1000) {
                socket00.getOrThrow().write(data)
            }
        }

        var buf = Array<Byte>(10000, repeat: 0)
        var readnum = 0
        var packet1 = 0
        while (readnum < data.size * 1000) {
            var readlen = clientsocket.read(buf)
            readnum += readlen
            packet1++
        }
        println(packet1)

        // detect if nodelay can be closed
        serversocket.noDelay = true
        clientsocket.noDelay = false // no influence here
        spawn {
            sleep(100 * Duration.millisecond)
            for (_ in 0..1000) {
                socket00.getOrThrow().write(data)
            }
        }

        readnum = 0
        var packet2 = 0
        while (readnum < data.size * 1000) {
            var readlen = clientsocket.read(buf)
            readnum += readlen
            packet2++
        }
        println(packet2)

        ser.getOrThrow().close()
        @Expect(packet2 > 2 * packet1, true)
    }

    @TestCase
    @Skip
    func test_nodelay_option_2(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var clientsocket = TcpSocket("127.0.0.1", port.load())
        clientsocket.connect(timeout: 2 * Duration.second)

        var serversocket = ser.getOrThrow().accept(timeout: Duration.second)

        // detect nodelay in clientsocket
        clientsocket.noDelay = false
        serversocket.noDelay = true // no influence here
        socket00 = Option<TcpSocket>.Some(clientsocket)
        spawn {
            sleep(100 * Duration.millisecond)
            for (_ in 0..1000) {
                socket00.getOrThrow().write(data)
            }
        }

        var buf = Array<Byte>(10000, repeat: 0)
        var readnum = 0
        var packet1 = 0
        while (readnum < data.size * 1000) {
            var readlen = serversocket.read(buf)
            readnum += readlen
            packet1++
        }
        println(packet1)

        // detect if nodelay can be closed
        clientsocket.noDelay = true
        serversocket.noDelay = false // no influence here
        spawn {
            sleep(100 * Duration.millisecond)
            for (_ in 0..1000) {
                socket00.getOrThrow().write(data)
            }
        }

        readnum = 0
        var packet2 = 0
        while (readnum < data.size * 1000) {
            var readlen = serversocket.read(buf)
            readnum += readlen
            packet2++
        }
        println(packet2)

        ser.getOrThrow().close()
        @Expect(packet2 > 2 * packet1, true)
    }
}
