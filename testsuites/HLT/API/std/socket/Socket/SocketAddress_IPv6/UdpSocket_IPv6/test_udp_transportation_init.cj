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
 * Test description: Test the transport mode in UdpSocket
 * Test API: public override func receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)
 *           public override func sendTo(recipient: SocketAddress, payload: Array<Byte>):Unit
 *           public func send(payload: Array<Byte>): Unit
 *           public func receive(buffer: Array<Byte>): Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

@When[os == "macOS"]
let flag = true
@When[os == "iOS"]
let flag = true
@When[os == "Linux"]
let flag = false
var data = Array<Byte>(500, repeat: 10)

@Test
class Test_Udp_TransPortation_Init {
    @TestCase
    func test_not_connect(): Unit {
        var udpsocket = UdpSocket(bindAt: 0)
        udpsocket.reusePort = true
        udpsocket.bind()
        var _ = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: 0)
        udpsocket1.reusePort = true
        udpsocket1.bind()
        var addr1 = udpsocket1.localAddress

        var buf = Array<Byte>(5000, repeat: 0)
        udpsocket.sendTo(addr1, data)
        udpsocket1.receiveFrom(buf)

        for (i in 0..data.size) {
            @Expect(buf[i], data[i])
        }
        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_connected_1(): Unit {
        // in connected status, can use all apis
        var udpsocket = UdpSocket(bindAt: 0)
        udpsocket.reusePort = true
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: 0)
        udpsocket1.reusePort = true
        udpsocket1.bind()
        var addr1 = udpsocket1.localAddress

        udpsocket.connect(addr1)
        udpsocket1.connect(addr)

        var buf = Array<Byte>(500, repeat: 0)
        var buf1 = Array<Byte>(500, repeat: 20)

        udpsocket.send(data)
        udpsocket1.send(data)
        udpsocket.receive(buf)
        udpsocket1.receive(buf1)
        @Expect(buf, data)
        @Expect(buf1, data)

        // macOS 不支持建联后sendTo
        if (!flag) {
            buf = Array<Byte>(500, repeat: 0)
            buf1 = Array<Byte>(500, repeat: 20)
            udpsocket.sendTo(addr1, data)
            udpsocket1.sendTo(addr, data)
            udpsocket.receiveFrom(buf)
            udpsocket1.receiveFrom(buf1)
            @Expect(buf, data)
            @Expect(buf1, data)
        }

        udpsocket.close()
        udpsocket1.close()
    }
}
