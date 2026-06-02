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
 * Test description: Test the combinations of ipv4 address and port,
 * ipv6 not supported now
 * Test API: init() Apis in Class TcpServerSocket & TcpSocket
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var legal_ipv4: Array<IPAddress> = [
    IPv4Address.localhost,
    IPv4Address.unspecified
]
var port = AtomicUInt16(0)
var bound = AtomicUInt16(0)

@Test
class Test_Tcp_IPv4 {
    public override func beforeEach(): Unit {
        bound = AtomicUInt16(0)
    }

    func startServer(address: SocketAddress): Unit {
        var server = TcpServerSocket(bindAt: address)
        server.bind()
        port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
        bound.fetchAdd(1)
        var serversocket = server.accept(timeout: 2 * Duration.second)
        sleep(100 * Duration.millisecond)
        serversocket.close()
        server.close()
    }
    //illegal ipv4 address will be checked when creating the instances of SocketAddress
    @TestCase
    func test_ipv4_illegal(): Unit {
        var arr_ipv4: Array<String> = [
            "127.0.0.1.1",
            "256.255.255.255",
            "127.0.0.a",
            "127..0.1"
        ]
        var sum = 0
        for (str in arr_ipv4) {
            try {
                IPSocketAddress(str, 0)
            } catch (e: IllegalArgumentException) {
                sum += 1
            }
            try {
                TcpSocket(str, 0)
            } catch (e: SocketException) {
                sum += 1
            }
        }
        try {
            IPSocketAddress([127u8, 0u8, 0u8, 1u8, 1u8], 0)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "IPSocketAddress only support IPv4 and IPv6 address.")
            sum += 1
        }
        @Expect(sum, 9)
    }

    @TestCase
    func test_server_ipv4_legal(): Unit {
        for (address in legal_ipv4) {
            var serversocket = TcpServerSocket(bindAt: IPSocketAddress(address, 0))
            serversocket.bind()
            var port_00 = (serversocket.localAddress as IPSocketAddress)?.port ?? 0
            @Expect(port_00 > 0, true)
            @Expect(serversocket.isClosed(), false)
            serversocket.close()
            @Expect(serversocket.isClosed(), true)
        }
    }

    @TestCase
    func test_server_ipv4_legal_port_occupied(): Unit {
        var sum = 0
        for (address in legal_ipv4) {
            var serversocket = TcpServerSocket(bindAt: IPSocketAddress(address, 0))
            serversocket.bind()
            port.store((serversocket.localAddress as IPSocketAddress)?.port ?? 0)
            var serversocket00 = TcpServerSocket(bindAt: IPSocketAddress(address, port.load()))
            try {
                serversocket00.bind()
            } catch (e: SocketException) {
                @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
                sum += 1
            }
            serversocket.close()
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_client_ipv4_none_legal(): Unit {
        spawn {
            startServer(IPSocketAddress(legal_ipv4[1], 0))
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var socket = TcpSocket(IPSocketAddress(legal_ipv4[0], port.load()))
        socket.connect()
        sleep(100 * Duration.millisecond)
        socket.close()
    }

    @TestCase
    func test_client_ipv4_legal_legal(): Unit {
        spawn {
            startServer(IPSocketAddress(legal_ipv4[1], 0))
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var rem_add = IPSocketAddress(legal_ipv4[1], port.load())
        var socket = TcpSocket(rem_add, localAddress: IPSocketAddress("127.0.0.1", 0))
        println(socket.localAddress)
        println(socket.remoteAddress)
        socket.connect()
        println(socket.localAddress)
        println(socket.remoteAddress)
        sleep(100 * Duration.millisecond)
        socket.close()
    }
}
