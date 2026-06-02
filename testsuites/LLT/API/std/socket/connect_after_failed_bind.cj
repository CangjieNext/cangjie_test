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
import std.fs.*

var sum = 0

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
class Test_Connect_After_Failed_Build {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_udp(): Unit {
        // both sockets sharing same address do not support reuse. Second socket should not be opened
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        reusePortAndAddr(udpsocket1, false)
        udpsocket1.bind()
        var addr = udpsocket1.localAddress

        var udpsocket2 = UdpSocket(bindAt: addr)
        reusePortAndAddr(udpsocket2, false)
        try {
            udpsocket2.bind()
            @Expect(false)
        } catch (e: SocketException) {
        }
        try {
            udpsocket2.connect(addr)
            @Expect(false)
        } catch (e: SocketException) {
            @Expect("The bind of the socket has failed.", e.message)
        }
        udpsocket1.close()
        udpsocket2.close()
    }
}
