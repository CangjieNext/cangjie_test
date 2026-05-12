/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test when using api in incorrect scenes,
 * if there are legal exception throwed
 * Test API: Apis in Class UdpSocket
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*

@When[os == "macOS"]
let flag = true
@When[os == "iOS"]
let flag = true
@When[os == "Linux"]
let flag = false
var sum = 0
var data = Array<Byte>(10, repeat: 10)

@Test
class Test_Udp_Incorrect_Invocation {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_init(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        var addr = udpsocket1.localAddress
        udpsocket.receiveTimeout = Duration.second
        try {
            udpsocket.connect(addr)
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "The socket is not bound: invoke bind() first.")
        }
        try {
            udpsocket.disconnect()
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "The socket is not bound: invoke bind() first.")
        }
        try {
            udpsocket.send(data)
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message.contains("not connected"), true)
        }
        try {
            udpsocket.receive(data)
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message.contains("not connected"), true)
        }

        try {
            udpsocket.sendTo(addr, data)
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message.contains("not bound"), true)
        }
        try {
            udpsocket.receiveFrom(data)
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message.contains("not bound"), true)
        }

        @Expect(udpsocket.isClosed(), false)
        udpsocket.close()
        @Expect(sum, 6)
    }

    @TestCase
    func test_binding(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()

        try {
            udpsocket.send(data)
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message.contains("not connected"), true)
        }
        try {
            udpsocket.receive(data)
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message.contains("not connected"), true)
        }

        @Expect(udpsocket.isClosed(), false)
        udpsocket.close()

        @Expect(sum, 2)
    }

    @TestCase
    func test_connected(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        udpsocket.receiveTimeout = Duration.second
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket1.bind()
        var addr = udpsocket1.localAddress
        udpsocket.connect(addr)

        var udpsocket2 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket2.bind()
        var addr1 = udpsocket2.localAddress

        if (!flag) {
            udpsocket.sendTo(addr, data)
            udpsocket.sendTo(addr1, data)
            var buf = Array<Byte>(10, repeat: 20)
            udpsocket2.receiveFrom(buf)
            @Expect(data, buf)
        }

        try {
            udpsocket.receiveFrom(data)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }

        @Expect(udpsocket.isClosed(), false)
        udpsocket.close()
        udpsocket1.close()
        udpsocket2.close()
    }

    @TestCase
    func test_closed(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        @Expect(udpsocket.isClosed(), false)
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket1.bind()
        var addr = udpsocket1.localAddress
        udpsocket.connect(addr)
        @Expect(udpsocket.isClosed(), false)
        udpsocket.disconnect()
        @Expect(udpsocket.isClosed(), false)
        udpsocket.close()
        @Expect(udpsocket.isClosed(), true)

        try {
            udpsocket.connect(addr)
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            udpsocket.disconnect()
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            udpsocket.send(data)
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            udpsocket.receive(data)
        } catch (e: SocketException) {
            sum += 1
        }

        try {
            udpsocket.sendTo(addr, data)
        } catch (e: SocketException) {
            sum += 1
        }

        try {
            udpsocket.receiveFrom(data)
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            udpsocket.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 7)
        udpsocket1.close()
    }
}
