/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*

var data = Array<Byte>(5000, repeat: 10)

@Test
class Test_Get_Address {
    @TestCase
    func test_closed_udp(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.close()
        var sum = 0
        try {
            udpsocket.remoteAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        try {
            udpsocket.localAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_closed_tcp(): Unit {
        var socket = TcpSocket(IPSocketAddress("127.0.0.1", 0))
        socket.close()
        var sum = 0
        try {
            socket.remoteAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        try {
            socket.localAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_closed_tcp_server(): Unit {
        var socket = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        socket.close()
        var sum = 0

        try {
            socket.localAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_closed_unixDatagram(): Unit {
        var socket = UnixDatagramSocket(bindAt: "/tmp/socket")
        socket.close()
        var sum = 0
        try {
            socket.remoteAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        try {
            socket.localAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_closed_unix(): Unit {
        var socket = UnixSocket("/tmp/socket")
        socket.close()
        var sum = 0
        try {
            socket.remoteAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        try {
            socket.localAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_closed_unixserver(): Unit {
        var socket = UnixServerSocket(bindAt: "/tmp/socket")
        socket.close()
        var sum = 0

        try {
            socket.localAddress
        } catch (e: Exception) {
            @Expect(e.message, "Socket is already closed")
            sum += 1
        }
        @Expect(sum, 1)
    }
}
