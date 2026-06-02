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

@When[os == "Windows" || os == "macOS"]
func reusePortOrAddr(socket: UdpSocket, reuse: Bool) {
    socket.reuseAddress = reuse
}

@When[os == "Linux"]
func reusePortOrAddr(socket: UdpSocket, reuse: Bool) {
    socket.reusePort = reuse
}

@Test
class Test_Udp_BufferSize {
    @TestCase
    func test_datagram_buffer_size(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress(IPv4Address.localhost, 0))
        reusePortOrAddr(udpsocket, true)
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: IPSocketAddress(IPv4Address.localhost, 0))
        reusePortOrAddr(udpsocket1, true)
        udpsocket1.bind()
        var addr1 = udpsocket1.localAddress

        udpsocket.connect(addr1)
        udpsocket1.connect(addr)

        println(udpsocket1.receiveBufferSize)

        var data = Array<Byte>(6507, repeat: 20)
        var buf = Array<Byte>(655350, repeat: 0)

        udpsocket.send(data)
        var datalen = udpsocket1.receive(buf)
        @Expect(datalen, data.size)

        for (i in 0..data.size) {
            @Expect(buf[i], data[i])
        }

        udpsocket.close()
        udpsocket1.close()
    }
}
