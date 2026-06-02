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
 * Test description: Test sendBufferSize and receiveBufferSize with
 * different inputs in udpsocket
 * Test API: public mut prop sendBufferSize: Int64
 *           public mut prop receiveBufferSize: Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

@When[os == "macOS"]
let flag = true
@When[os != "macOS"]
let flag = false
var port = AtomicUInt16(0)

@Test
class Test_Udp_Buffer_Size {
    @TestCase
    func test_size_1(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        var sum = 0
        var sndbuf = udpsocket.sendBufferSize
        var rcvbuf = udpsocket.receiveBufferSize

        udpsocket.bind()
        @Expect(udpsocket.sendBufferSize, sndbuf)
        @Expect(udpsocket.receiveBufferSize, rcvbuf)
        udpsocket.connect(IPSocketAddress("127.0.0.1", 63211))
        @Expect(udpsocket.sendBufferSize, sndbuf)
        @Expect(udpsocket.receiveBufferSize, rcvbuf)
        udpsocket.close()
        try {
            udpsocket.sendBufferSize = 1
        } catch (e: SocketException) {
            sum += 1
        }
        try {
            udpsocket.receiveBufferSize
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_different_input_size(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        var sum = 0
        udpsocket.sendBufferSize = 1000
        udpsocket.receiveBufferSize = 100000
        try {
            udpsocket.sendBufferSize = 0
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        try {
            udpsocket.receiveBufferSize = -100000
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        udpsocket.bind()
        udpsocket.sendBufferSize = 1000000
        udpsocket.receiveBufferSize = 1

        udpsocket.connect(IPSocketAddress("127.0.0.1", 63211))

        udpsocket.sendBufferSize = 1
        udpsocket.receiveBufferSize = 1000000
        udpsocket.close()
        @Expect(sum, 2)
    }
}
