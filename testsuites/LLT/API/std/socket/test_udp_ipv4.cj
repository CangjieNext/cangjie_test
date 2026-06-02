/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the combinations of ipv4 address and port,
 * ipv6 not supported now
 * Test API: init() Apis in Class UdpSocket
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*

@When[os == "Windows"]
func reusePortOrAddr(socket: UdpSocket, reuse: Bool) {
    socket.reuseAddress = reuse
}

@When[os != "Windows"]
func reusePortOrAddr(socket: UdpSocket, reuse: Bool) {
    socket.reusePort = reuse
}

// Attempt to bind used port with default parameters is system-dependent, thus test should be executed only on Linux
@Test
class Test_Udp_IPv4 {
    @TestCase
    func test_ipv4_legal(): Unit {
        var udpsocket = UdpSocket(bindAt: 0)
        udpsocket.bind()
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket1.bind()

        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_ipv4_port_occupied(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        reusePortOrAddr(udpsocket, false)
        udpsocket.bind()
        var port = (udpsocket.localAddress as IPSocketAddress)?.port ?? 0
        println(udpsocket.localAddress)
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", port))
        var sum = 0
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
        }

        udpsocket.close()
        udpsocket1.close()
        @Expect(sum, 1)
    }
}
