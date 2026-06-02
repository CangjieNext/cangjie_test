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
 * Test description: Test the reusePort and reuseAddress option
 * Test API: public mut prop reusePort: Bool
 *           public mut prop reuseAddress: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*

@When[os == "Windows"]
func reusePortAndAddr(socket: UdpSocket, reuse: Bool) {
    socket.reuseAddress = reuse
}

@When[os != "Windows"]
func reusePortAndAddr(socket: UdpSocket, reuse: Bool) {
    socket.reuseAddress = reuse
    socket.reusePort = reuse
}

@Test
class Test_Udp_ReusePort_ReuseAddress {
    @TestCase
    func test_reuse_false_01(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        reusePortAndAddr(udpsocket, false)
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: addr)
        reusePortAndAddr(udpsocket1, false)

        var sum = 0
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 1)

        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_reuse_true_02(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        reusePortAndAddr(udpsocket, true)
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: addr)
        reusePortAndAddr(udpsocket1, true)

        var sum = 0
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 0)

        udpsocket.close()
        udpsocket1.close()
    }
}
