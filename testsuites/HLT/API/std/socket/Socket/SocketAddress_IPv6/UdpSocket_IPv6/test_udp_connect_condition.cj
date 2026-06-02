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
 * Test description: Test different connect scenes
 * Test API: public func connect(remote: SocketAddress): Unit
 *           public func disconnect(): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var data = Array<Byte>(5000, repeat: 10)
var sum = 0

@Test
class Test_Tcp_Connect_Condition {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        udpsocket1.bind()

        var addr = udpsocket.localAddress
        udpsocket1.connect(addr)
        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_02(): Unit {
        //connect to udpsocket itself
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        var addr = udpsocket.localAddress
        udpsocket.connect(addr)

        var buf = Array<Byte>(5000, repeat: 0)
        udpsocket.send(data)
        udpsocket.receive(buf)

        @Expect(data, buf)
        udpsocket.close()
    }

    @TestCase
    func test_03(): Unit {
        //connect to unexist udpsocket 
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()

        udpsocket.connect(IPSocketAddress("::1", 64321))
        udpsocket.close()
    }

    @TestCase
    func test_04(): Unit {
        //connect to closed udpsocket 
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        var addr = udpsocket.localAddress
        udpsocket.close()
        sleep(Duration.second)

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket1.bind()
        udpsocket1.connect(addr)
        udpsocket1.close()
    }

    @TestCase
    func test_05(): Unit {
        //connect to udpsocket with full receivebuffer
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        var addr = udpsocket.localAddress
        udpsocket.receiveBufferSize = 1000
        udpsocket.sendBufferSize = 1000

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket1.bind()

        for (_ in 0..15) {
            udpsocket1.sendTo(addr, data)
        }

        udpsocket1.connect(addr)
        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_06(): Unit {
        //connect before binding
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        try {
            udpsocket1.connect(addr)
        } catch (e: SocketException) {
            @Expect(e.message.contains("not bound"), true)
            sum += 1
        }
        udpsocket1.bind()
        udpsocket1.connect(addr)
        udpsocket.close()
        udpsocket1.close()
        @Expect(udpsocket.isClosed(), true)
        @Expect(udpsocket1.isClosed(), true)
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //connect to each other
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        var addr = udpsocket.localAddress
        udpsocket.receiveTimeout = Duration.second

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket1.bind()
        var addr1 = udpsocket1.localAddress

        udpsocket1.connect(addr)
        udpsocket.connect(addr1)

        var udpsocket2 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket2.bind()
        udpsocket2.sendTimeout = Duration.second
        var buf = Array<Byte>(5000, repeat: 0)

        // no exception here
        udpsocket2.sendTo(addr, data)

        try {
            udpsocket.receive(buf)
        } catch (e: SocketTimeoutException) {
            sum += 1
        }
        @Expect(buf, Array<Byte>(5000, repeat: 0))
        udpsocket.close()
        udpsocket1.close()
        udpsocket2.close()
        @Expect(sum, 1)
    }

    @TestCase
    func test_08(): Unit {
        // test reconnect
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket1.bind()

        udpsocket1.connect(addr)
        try {
            udpsocket1.connect(addr)
        } catch (e: SocketException) {
            @Expect(e.message, "The socket is already connected")
            sum += 1
        }

        udpsocket1.disconnect()
        // udpsocket1.connect(addr)
        // udpsocket1.disconnect()

        var udpsocket2 = UdpSocket(bindAt: IPSocketAddress("::1", 0))
        udpsocket2.bind()
        var addr2 = udpsocket2.localAddress
        udpsocket1.connect(addr2)
        udpsocket.close()
        udpsocket1.close()
        udpsocket2.close()
        @Expect(sum, 1)
    }
}
