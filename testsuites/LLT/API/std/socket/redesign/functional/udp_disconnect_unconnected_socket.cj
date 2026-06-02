/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*

@Test
class Test_Udp_Disconnect_Unconnected {
    @TestCase
    func test_disconnect_after_bind(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        udpsocket.bind()
        try {
            udpsocket.disconnect()
            udpsocket.disconnect()
            udpsocket.disconnect()
            @Assert(true)
        } catch (e: SocketException) {
            @Assert(false)
        }
        udpsocket.close()
    }

    @TestCase
    func test_disconnect_before_bind(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        try {
            udpsocket.disconnect()
            @Assert(false)
        } catch (e: SocketException) {
            @Expect(e.message, "The socket is not bound: invoke bind() first.")
        }
        udpsocket.close()
    }

    @TestCase
    func test_disconnect_after_close(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))

        udpsocket.bind()
        udpsocket.close()

        try {
            udpsocket.disconnect()
            @Assert(false)
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
        }
    }
}
