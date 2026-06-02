/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the remoteAddress and localAddress option
 * Test API: public override prop remoteAddress: ?SocketAddress
 *           public override prop localAddress: SocketAddress
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*

var data = Array<Byte>(5000, repeat: 10)

@Test
class Test_Udp_Address {
    @TestCase
    func test_not_connect(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        @Expect(udpsocket.localAddress, IPSocketAddress("::1", 0))
        try {
            udpsocket.remoteAddress
            @Expect(1, 2)
        } catch (e: SocketException) {
        }

        udpsocket.bind()
        udpsocket.localAddress
        try {
            udpsocket.remoteAddress
            @Expect(1, 2)
        } catch (e: SocketException) {
        }

        udpsocket.close()
        var sum = 0
        try {
            udpsocket.localAddress
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            udpsocket.remoteAddress
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_connect(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        @Expect(udpsocket.localAddress, IPSocketAddress("::1", 0))
        @Expect(udpsocket1.localAddress, IPSocketAddress("::1", 0))
        try {
            udpsocket.remoteAddress
            udpsocket1.remoteAddress
            @Expect(1, 2)
        } catch (e: SocketException) {
        }

        udpsocket.bind()
        udpsocket1.bind()
        var addr = udpsocket.localAddress
        var addr1 = udpsocket1.localAddress
        try {
            udpsocket.remoteAddress
            udpsocket1.remoteAddress
            @Expect(1, 2)
        } catch (e: SocketException) {
        }

        udpsocket1.connect(addr)
        udpsocket.connect(addr1)

        @Expect(udpsocket.localAddress, addr)
        @Expect((udpsocket1.localAddress as IPSocketAddress)?.port ?? 0, (addr1 as IPSocketAddress)?.port ?? 0)

        @Expect(udpsocket1.remoteAddress, addr)

        udpsocket.close()
        udpsocket1.close()
        var sum = 0
        try {
            udpsocket.localAddress
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            udpsocket.remoteAddress
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 2)
    }
}
