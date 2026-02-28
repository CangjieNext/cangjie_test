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
 * Test description: Test the timeout parameters in UdpSocket
 * Test API: public override func receiveFrom(buffer: Array<Byte>): (SocketAddress, Int64)
 *           public override func sendTo(recipient: SocketAddress, payload: Array<Byte>):Unit
 *           public func send(payload: Array<Byte>): Unit
 *           public func receive(buffer: Array<Byte>): Int64
 *           public override mut prop receiveTimeout: ?Duration
 *           public override mut prop sendTimeout: ?Duration
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var data = Array<Byte>(32000, repeat: 20)
var udp = Option<UdpSocket>.None
var addr00 = IPSocketAddress("0.0.0.0", 0)
@When[os == "macOS"]
let flag = "Failed to write data 40: Message too long."
@When[os == "iOS"]
let flag = "Failed to write data 40: Message too long."
@When[os == "Linux"]
let flag = "Connection refused"

@Test
class Test_Udp_TransPortation_Timeout {
    @TestCase
    func test_sendtimeout(): Unit {
        var sum = 0

        var udpsocket = UdpSocket(bindAt: 0)
        udpsocket.reusePort = true
        udpsocket.bind()
        var addr = udpsocket.localAddress
        // difficult to make send timeout
        udpsocket.sendBufferSize = 1000
        udpsocket.sendTimeout = 100 * Duration.millisecond

        var udpsocket1 = UdpSocket(bindAt: 0)
        udpsocket1.reusePort = true
        udpsocket1.bind()
        udpsocket1.receiveBufferSize = 1000
        var addr1 = udpsocket1.localAddress

        udpsocket.connect(addr1)
        udpsocket1.connect(addr)
        udpsocket1.close()
        sleep(100 * Duration.millisecond)

        try {
            for (_ in 0..10) {
                udpsocket.send(data)
            }
        } catch (e: SocketException) {
            sum += 1
            print("1111111111111111111")
            print(e.message.toString())
            print("222222222222222222")
            @Expect(e.message.contains(flag))
        }
        try {
            for (_ in 0..10) {
                udpsocket.sendTo(addr1, data)
            }
        } catch (e: SocketException) {
            sum += 1
            print("3333333333333333333")
            print(e.message.toString())
            print("4444444444444444444")
            @Expect(e.message.contains(flag))
        }

        @Expect(sum, 2)
        udpsocket.close()
    }

    @TestCase
    func test_receivetimeout(): Unit {
        var sum = 0

        var udpsocket = UdpSocket(bindAt: 0)
        udpsocket.reusePort = true
        udpsocket.bind()
        var addr = udpsocket.localAddress
        udpsocket.receiveTimeout = 100 * Duration.millisecond

        var udpsocket1 = UdpSocket(bindAt: 0)
        udpsocket1.reusePort = true
        udpsocket1.bind()
        var addr1 = udpsocket1.localAddress

        var buf = Array<Byte>(32000, repeat: 20)
        try {
            udpsocket.receiveFrom(buf)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        udpsocket.receiveTimeout = Duration.Zero
        try {
            udpsocket.receiveFrom(buf)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        udpsocket.connect(addr1)
        udpsocket1.connect(addr)

        udpsocket.receiveTimeout = 100 * Duration.millisecond
        try {
            udpsocket.receive(buf)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        udpsocket.receiveTimeout = Duration.Zero
        try {
            udpsocket.receive(buf)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        @Expect(sum, 4)
        udpsocket.close()
        udpsocket1.close()
    }
}
