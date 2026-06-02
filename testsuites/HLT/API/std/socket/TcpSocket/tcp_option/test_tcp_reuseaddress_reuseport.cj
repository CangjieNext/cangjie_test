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
 * Test description: Test the combinations of ipv4 address and port,
 * and if reusePort and reuseAddress work here
 * Test API: init() Apis in Class TcpServerSocket & TcpSocket
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var cli = Option<TcpSocket>.None
var data = Array<Byte>(50000, repeat: 10)

@Test
class Test_Tcp_ReuseAddress {
    @TestCase
    func Test_DisableReuseAddr_ExpectSocketException(): Unit {
        var server1 = TcpServerSocket(bindAt: IPSocketAddress("0.0.0.0", 0))
        server1.reuseAddress = false
        server1.bind()
        port.store((server1.localAddress as IPSocketAddress)?.port ?? 0)
        println(server1.localAddress)

        var client = TcpSocket("0.0.0.0", port.load())
        client.connect()
        server1.accept()

        var client1 = TcpSocket("0.0.0.0", port.load())
        client1.connect()
        server1.accept()

        var client2 = TcpSocket("0.0.0.0", port.load())
        client2.connect()
        server1.accept()

        var client3 = TcpSocket("0.0.0.0", port.load())
        client3.connect()
        var serversocket3 = server1.accept()
        cli = Option<TcpSocket>.Some(serversocket3)

        var server2 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", port.load()))
        server2.reuseAddress = false
        spawn {
            cli.getOrThrow().write(data)
        }
        server1.close()
        try {
            server2.bind()
            @Expect(false)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
        }
        server2.close()
    }

    @TestCase
    func Test_EnableReuseAddr_Success(): Unit {
        var server1 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server1.reuseAddress = true
        server1.bind()
        port.store((server1.localAddress as IPSocketAddress)?.port ?? 0)
        println(server1.localAddress)
        var client = TcpSocket("127.0.0.1", port.load())
        client.connect()
        server1.accept()

        var server2 = TcpServerSocket(bindAt: IPSocketAddress("0.0.0.0", port.load()))
        server2.reuseAddress = true
        server1.close()
        server2.bind()
        println(server2.localAddress)
        server2.close()
    }
}

@Test
class Test_Tcp_ReusePort {
    @TestCase
    func test_01(): Unit {
        var server1 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server1.reusePort = true
        server1.bind()
        port.store((server1.localAddress as IPSocketAddress)?.port ?? 0)

        var server2 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", port.load()))
        server2.reusePort = true
        server2.bind()
        println(server2.localAddress)

        var server3 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", port.load()))
        server3.reusePort = true
        server3.bind()

        server1.close()
        server2.close()
        server3.close()
    }

    @TestCase
    func test_02(): Unit {
        var server1 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server1.reusePort = false
        server1.bind()
        port.store((server1.localAddress as IPSocketAddress)?.port ?? 0)

        var server2 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", port.load()))
        server2.reusePort = true
        var sum = 0
        try {
            server2.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 1)

        server1.close()
        server2.close()
    }
}

@Test
class Test_Tcp_ReuseAddress_ReusePort {
    @TestCase
    func test_01(): Unit {
        var server1 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        server1.reusePort = true
        server1.reuseAddress = false
        server1.bind()
        port.store((server1.localAddress as IPSocketAddress)?.port ?? 0)

        var server2 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", port.load()))
        server2.reusePort = true
        server1.reuseAddress = true
        server2.bind()
        println(server2.localAddress)

        var server3 = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", port.load()))
        server3.reusePort = true
        server1.reuseAddress = false
        server3.bind()

        server1.close()
        server2.close()
        server3.close()
    }
}
