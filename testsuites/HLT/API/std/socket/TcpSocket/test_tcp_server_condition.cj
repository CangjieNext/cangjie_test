/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test when we raise connection in tcp client, how condition
 * of server do with this process
 * Test API: public func connect(timeout!: ?Duration = None)
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var sum = 0
var ser = Option<TcpServerSocket>.None
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_Server_Condition {
    public override func beforeEach(): Unit {
        sum = 0
        bound = AtomicUInt16(0)
    }

    func startServer(): Unit {
        var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
        try {
            server.accept(timeout: 0.5 * Duration.second)
            server.accept(timeout: 0.5 * Duration.second)
        } catch (e: SocketTimeoutException) {
        }
    }

    func startServer1(): Unit {
        var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server.bind()
        ser = Option<TcpServerSocket>.Some(server)
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        try {
            var _ = server.accept(timeout: 1.5 * Duration.second)
        } catch (e: SocketException) {
            @Assert(false) // Server should accept client1 connection
        }
        try {
            var _ = server.accept(timeout: 1.5 * Duration.second)
            @Assert(false) // Server should be closed while client2 is waiting for connection
        } catch (e: SocketException) {
        }
    }

    @TestCase
    func test_server_only_init(): Unit {
        var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 1234))
        var socket = TcpSocket(IPSocketAddress("127.0.0.1", 1234))
        try {
            // fails when server not bind to the port
            socket.connect()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Connection refused"), true)
            sum += 1
        }
        @Expect(sum, 1)
        server.close()
    }

    @TestCase
    func test_server_only_bind(): Unit {
        var server = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        var socket = TcpSocket(IPSocketAddress("127.0.0.1", port.load()))
        //the socket is in the backlog queue
        //when server do accept, we get this socket
        socket.connect()
        socket.writeTimeout = Duration.second
        //the buffer is created too
        socket.write([1u8, 1u8])
        socket.close()
    }

    @TestCase
    func test_server_in_connection_1(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var client1 = TcpSocket(IPSocketAddress("127.0.0.1", port.load()))
        client1.connect()
        var client2 = TcpSocket(IPSocketAddress("127.0.0.1", port.load()))
        client2.connect()
        //two sockets cannot have same remote & local address
        @Expect(client1.localAddress == client2.localAddress, false)
        client1.close()
        client2.close()
    }

    @TestCase
    func test_server_in_connection_2(): Unit {
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var client1 = TcpSocket(IPSocketAddress("127.0.0.1", port.load()))
        client1.connect()
        var client2 = TcpSocket(client1.remoteAddress, localAddress: client1.localAddress)
        try {
            client2.connect()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
            sum += 1
        }
        client1.close()
        @Expect(sum, 1)
    }

    @TestCase
    func test_server_closed(): Unit {
        spawn {
            startServer1()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }

        var client1 = TcpSocket(IPSocketAddress("127.0.0.1", port.load()))
        client1.connect()
        client1.close()

        // we need this sleep because connect() and accept() are done async
        // in the kernel so a successful connect() doesn't necessarily mean 
        // that we already passed accept() at server so too early close may
        // break the first accept invocation
        sleep(Duration.second)
        // close server
        ser.getOrThrow().close()
        sleep(Duration.second)

        var client2 = TcpSocket(IPSocketAddress("127.0.0.1", port.load()))
        try {
            // should not have connect success
            client2.connect()
            client2.write(Array<Byte>(1000, repeat: 0))
        } catch (e: SocketException) {
            sum += 1
        }
        client1.close()
        @Expect(sum, 1)
    }
}
