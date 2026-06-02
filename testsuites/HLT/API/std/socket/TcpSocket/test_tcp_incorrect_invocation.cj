/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test when we use tcp apis in unproper situations
 * Test API: Apis in Class TcpServerSocket & TcpSocket
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var socketaddress_ipv4 = IPSocketAddress([0u8, 0u8, 0u8, 0u8], 0)
var server1 = TcpServerSocket(bindAt: 0)
var server2 = TcpServerSocket(bindAt: socketaddress_ipv4)
var arrayserver: Array<TcpServerSocket> = [server1, server2]
var arrayserver_00: Array<TcpServerSocket> = [TcpServerSocket(bindAt: 0), TcpServerSocket(bindAt: socketaddress_ipv4)]
var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None
var sum = 0
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_Incorrect_Invocation {
    public override func beforeEach(): Unit {
        sum = 0
        bound = AtomicUInt16(0)
    }

    func startServer(addr: SocketAddress): Unit {
        var server = TcpServerSocket(bindAt: addr)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        ser = Option<TcpServerSocket>.Some(server)
    }

    @TestCase
    func test_server_init(): Unit {
        for (server in arrayserver) {
            try {
                server.accept()
            } catch (e: SocketException) {
                sum += 1
            }
            try {
                server.accept(timeout: 50 * Duration.millisecond)
            } catch (e: SocketException) {
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_bind(): Unit {
        for (server in arrayserver) {
            server.bind()
            try {
                server.bind()
            } catch (e: SocketException) {
                sum += 1
            }
            server.close()
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_server_closed(): Unit {
        for (server in arrayserver_00) {
            server.bind()
            server.close()
            @Expect(server.isClosed(), true)
            sleep(200 * Duration.millisecond)
            // can close many times
            server.close()
            @Expect(server.isClosed(), true)
        }
    }

    @TestCase
    func test_client_init(): Unit {
        var client = TcpSocket("127.0.0.1", 12345)
        var buf = Array<Byte>(10, repeat: 0)
        try {
            client.read(buf)
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            client.write(buf)
        } catch (e: SocketException) {
            sum += 1
        }
        client.close()
        @Expect(sum, 2)
    }

    @TestCase
    func test_client_self_connection(): Unit {
        spawn {
            startServer(socketaddress_ipv4)
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var addr00 = IPSocketAddress("0.0.0.0", port.load())
        var client = TcpSocket(addr00, localAddress: addr00)
        try {
            client.connect()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_client_closed(): Unit {
        spawn {
            startServer(socketaddress_ipv4)
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var client = TcpSocket(IPSocketAddress("0.0.0.0", port.load()))
        client.connect()
        client.close()
        @Expect(client.isClosed(), true)
        for (_ in 0..100) {
            client.close()
        }
        @Expect(client.isClosed(), true)
    }

    @TestCase
    func test_client_000(): Unit {
        spawn {
            startServer(IPSocketAddress("127.0.0.1", 0))
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var client = TcpSocket(IPSocketAddress("127.0.0.1", port.load()),
            localAddress: IPSocketAddress("127.0.0.1", port.load()))
        try {
            client.connect()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
            sum += 1
        }
        @Expect(sum, 1)
    }
}
