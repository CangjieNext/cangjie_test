/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the close process of UdpSocket
 * Test API: public override func close()
 *           public override func isClosed()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var data = Array<Byte>(32000, repeat: 20)
var udp = Option<UdpSocket>.None
var addr00 = IPSocketAddress("127.0.0.1", 0)
var flag = 0

@Test
class Test_Udp_Close {
    public override func beforeEach(): Unit {
        flag = 0
    }

    @TestCase
    func test_01(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        @Expect(udpsocket.isClosed(), false)
        udpsocket.close()
        @Expect(udpsocket.isClosed(), true)
        udpsocket.close()
        @Expect(udpsocket.isClosed(), true)
    }

    @TestCase
    func test_02(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        @Expect(udpsocket.isClosed(), false)
        udpsocket.close()
        @Expect(udpsocket.isClosed(), true)
        udpsocket.close()
        @Expect(udpsocket.isClosed(), true)
    }

    @TestCase
    func test_03(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        udp = Option<UdpSocket>.Some(udpsocket)
        spawn {
            flag = 1
            udp.getOrThrow().receiveFrom(data)
        }
        while (flag == 0) {
            sleep(Duration.millisecond)
        }
        udpsocket.close()
        @Expect(udpsocket.isClosed(), true)
    }

    @TestCase
    func test_04(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        udp = Option<UdpSocket>.Some(udpsocket)

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket1.bind()
        addr00 = (udpsocket1.localAddress as IPSocketAddress) ?? throw Exception("not IPSocketAddress")
        udpsocket.connect(addr00)
        spawn {
            while (true) {
                udp.getOrThrow().send(data)
            }
        }
        udpsocket.close()
        @Expect(udpsocket.isClosed(), true)
        udpsocket1.close()
    }
}
