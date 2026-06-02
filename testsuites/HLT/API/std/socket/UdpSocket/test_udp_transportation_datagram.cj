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
 * Test description: Test the limititation of datagram in UdpSocket
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
let (flag, data_size) = (true, 200)

@When[os != "macOS"]
let (flag, data_size) = (false, 32000)

var udp = Option<UdpSocket>.None
var data00 = Array<Byte>(data_size, repeat: 20)
var count = 0

@Test
class Test_Udp_TransPortation_Datagram {
    @TestCase
    func test_datagram_maxsize(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.reusePort = true
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket1.reusePort = true
        udpsocket1.bind()
        var addr1 = udpsocket1.localAddress

        udpsocket.connect(addr1)
        udpsocket1.connect(addr)

        println(udpsocket1.receiveBufferSize)

        if (!flag) {
            var data = Array<Byte>(65507, repeat: 20)
            var data000 = Array<Byte>(65508, repeat: 20)
            var buf = Array<Byte>(105535, repeat: 0)

            udpsocket.send(data)
            var datalen = udpsocket1.receive(buf)
            @Expect(datalen, data.size)
            for (i in 0..data.size) {
                @Expect(buf[i], data[i])
            }

            var sum = 0
            try {
                udpsocket.send(data000)
            } catch (e: SocketException) {
                sum += 1
                @Expect(e.message, "Unable to send datagram larger than 65507.")
            }
            @Expect(sum, 1)
        }

        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_datagram_truncate(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.reusePort = true
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket1.reusePort = true
        udpsocket1.bind()
        udpsocket1.receiveTimeout = Duration.second
        var addr1 = udpsocket1.localAddress

        udpsocket.connect(addr1)
        udpsocket1.connect(addr)

        udpsocket1.receiveTimeout = Duration.second

        udp = Option<UdpSocket>.Some(udpsocket)

        var buf = Array<Byte>(65535, repeat: 0)

        spawn {
            udp?.send(data00)
        }
        try {
            count = udpsocket1.receive(buf)
        } catch (e: SocketTimeoutException) {}
        if (count != 0 && count != data_size) {
            println("datagram truncate")
            @Expect(1, 2)
        }

        udpsocket.close()
        udpsocket1.close()
    }
}
