/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the reusePort and reuseAddress option
 * Test API: public mut prop reusePort: Bool
 *           public mut prop reuseAddress: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*

var sum = 0

@Test
class Test_Udp_ReusePort_ReuseAddress {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_default_settings(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        @Expect(udpsocket.reuseAddress, false)
        try {
            udpsocket.reusePort
            @Expect(1, 2)
        } catch (e: SocketException) {
        }
        udpsocket.bind()
        @Expect(udpsocket.reuseAddress, false)
        try {
            udpsocket.reusePort
            @Expect(1, 2)
        } catch (e: SocketException) {
        }
        var _ = udpsocket.localAddress
        udpsocket.close()
        try {
            udpsocket.reuseAddress
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        try {
            udpsocket.reusePort = true
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_reuseaddr_01(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.reuseAddress = false
        udpsocket.bind()
        var addr = udpsocket.localAddress
        udpsocket.close()

        var udpsocket1 = UdpSocket(bindAt: addr)
        udpsocket1.reuseAddress = false
        udpsocket1.bind()
        udpsocket.close()
        udpsocket1.close()
    }

    // windows reuseaddr 包含 reuseport 功能
    @TestCase
    func test_reuseport_1(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        udpsocket.reuseAddress = false
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: addr)
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 1)
        udpsocket1.reuseAddress = false
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 2)
        udpsocket.close()
        udpsocket1.close()
    }
}
