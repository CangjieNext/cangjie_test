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
 * Test description: Test the concurrent scenes of UdpSocket
 * Test API: apis in UdpSocket
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var data = Array<Byte>(320, repeat: 20)
var udp = Option<UdpSocket>.None
var addr00 = IPSocketAddress("127.0.0.1", 0)
var flag = 0

@Test
class Test_Udp_Concurrency {
    public override func beforeEach(): Unit {
        flag = 0
    }

    func startUdp(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.reusePort = true
        udpsocket.reuseAddress = true
        udpsocket.bind()
        udpsocket.close()
    }

    @TestCase
    func test_01(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        addr00 = (udpsocket.localAddress as IPSocketAddress) ?? throw Exception("not IPSocketAddress")

        for (_ in 0..1000) {
            var fu = spawn {
                startUdp()
            }
            fu.get()
        }
        flag = 1
        while (flag == 0) {
            sleep(Duration.millisecond)
        }
        udpsocket.close()
    }

    @TestCase
    func test_02(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        addr00 = (udpsocket.localAddress as IPSocketAddress) ?? throw Exception("not IPSocketAddress")

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket1.bind()
        udpsocket1.connect(addr00)
        try {
            udpsocket1.connect(IPSocketAddress("127.0.0.1", 23330))
            @Expect(1, 2)
        } catch (e: SocketException) {}

        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_03(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        var addr = udpsocket.localAddress as IPSocketAddress ?? throw Exception("not IPSocketAddress")

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket1.bind()
        var addr1 = udpsocket1.localAddress as IPSocketAddress ?? throw Exception("not IPSocketAddress")

        var udpsocket2 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket2.bind()
        var addr2 = udpsocket1.localAddress as IPSocketAddress ?? throw Exception("not IPSocketAddress")

        udpsocket.connect(addr1)

        var buf = Array<Byte>(320, repeat: 0)
        udpsocket.send(data)
        // can not get
        udpsocket1.receiveFrom(buf)

        @Expect(buf, data)
        udpsocket2.sendTo(addr, data)
        udpsocket.close()
        udpsocket1.close()
        udpsocket2.close()
    }
}
