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
 * Test description: Test sendBufferSize and receiveBufferSize with
 * different inputs in tcp server or socket
 * Test API: public mut prop sendBufferSize: Int64
 *           public mut prop receiveBufferSize: Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var bound = AtomicUInt16(0)
@When[os == "macOS"]
let flag = true
@When[os != "macOS"]
let flag = false

@Test
class Test_Tcp_Buffer_Size {
    public override func beforeEach(): Unit {
        bound = AtomicUInt16(0)
    }

    func startServer(): Unit {
        var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
    }

    @TestCase
    func test_size_change_or_not(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var sum = 0
        var client = TcpSocket("127.0.0.1", port.load())

        client.connect(timeout: 2 * Duration.second)
        var serversocket = ser.getOrThrow().accept()
        client.close()
        // throw exception if socket closed
        try {
            client.sendBufferSize
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        try {
            client.receiveBufferSize
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }

        ser.getOrThrow().close()
        sleep(Duration.second)

        serversocket.close()
        // can not get when serversocket close
        try {
            serversocket.sendBufferSize
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        try {
            serversocket.receiveBufferSize
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_different_input_size(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var sum = 0
        var client = TcpSocket("127.0.0.1", port.load())
        // can not be zero or negative
        try {
            client.sendBufferSize = -1
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        try {
            client.receiveBufferSize = 0
        } catch (e: IllegalArgumentException) {
            sum += 1
        }

        try {
            ser.getOrThrow().sendBufferSize = 0
            println(ser.getOrThrow().sendBufferSize)
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        try {
            ser.getOrThrow().receiveBufferSize = -1
            println(ser.getOrThrow().receiveBufferSize)
        } catch (e: IllegalArgumentException) {
            sum += 1
        }

        client.sendBufferSize = 1
        client.receiveBufferSize = 1
        ser.getOrThrow().sendBufferSize = 10000
        ser.getOrThrow().receiveBufferSize = 20000

        // change by the kernel
        var cli_sndbuf = client.sendBufferSize
        var cli_rcvbuf = client.receiveBufferSize

        client.connect(timeout: 2 * Duration.second)
        if (flag) {
            cli_sndbuf = client.sendBufferSize
            cli_rcvbuf = client.receiveBufferSize
        }
        @Expect(client.sendBufferSize, cli_sndbuf)
        @Expect(client.receiveBufferSize, cli_rcvbuf)

        var serversocket = ser.getOrThrow().accept()
        @Expect(client.sendBufferSize, cli_sndbuf)
        @Expect(client.receiveBufferSize, cli_rcvbuf)
        if (!flag) {
            @Expect(cli_sndbuf == serversocket.sendBufferSize, false)
            @Expect(cli_rcvbuf == serversocket.receiveBufferSize, false)
        }

        client.close()
        // throw exception if socket closed
        try {
            client.sendBufferSize = 2345
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        try {
            client.receiveBufferSize = 8765
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }

        serversocket.close()
        try {
            serversocket.sendBufferSize
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        try {
            serversocket.receiveBufferSize
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }

        @Expect(sum, 8)
        ser.getOrThrow().close()
    }
}
