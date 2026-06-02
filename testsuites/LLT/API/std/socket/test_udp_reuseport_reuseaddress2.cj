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
 * Test description: Test the reusePort and reuseAddress option
 * Test API: public mut prop reusePort: Bool
 *           public mut prop reuseAddress: Bool
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*

var sum = 0

@When[os == "Windows"]
func reusePortAndAddr(socket: UdpSocket, reuse: Bool) {
    socket.reuseAddress = reuse
}

@When[os != "Windows"]
func reusePortAndAddr(socket: UdpSocket, reuse: Bool) {
    socket.reuseAddress = reuse
    socket.reusePort = reuse
}

@Test
class Test_Udp_ReusePort_ReuseAddress {
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_reuseaddr_01(): Unit {
        // both sockets sharing same address do not support reuse. Second socket should not be opened
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        reusePortAndAddr(udpsocket, false)
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: addr)
        reusePortAndAddr(udpsocket1, false)
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 1)

        udpsocket.close()
        udpsocket1.close()
    }

    @TestCase
    func test_error_02(): Unit {
        /*
        Socket 1 - support reuse (default behaviour)
        Socket 2 - explicit disable reuse. It should not be opened with exception.
        Socket 3 - explicit enable reuse. Bind should pass (Socket 1 allows, Socket 2 was not binded)
         */
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        reusePortAndAddr(udpsocket, true)
        udpsocket.bind()
        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: addr)
        reusePortAndAddr(udpsocket1, false)
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 1)

        var udpsocket2 = UdpSocket(bindAt: addr)
        reusePortAndAddr(udpsocket2, true)
        try {
            udpsocket2.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 1)

        udpsocket.close()
        udpsocket1.close()
        udpsocket2.close()
    }

    @TestCase
    func test_error_messages(): Unit {
        var udpsocket = UdpSocket(bindAt: IPSocketAddress("127.0.0.1", 0))
        reusePortAndAddr(udpsocket, true)
        udpsocket.bind()
        try {
            udpsocket.bind()
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "The socket is already bound")
        }
        @Expect(sum, 1)

        var addr = udpsocket.localAddress

        var udpsocket1 = UdpSocket(bindAt: addr)
        reusePortAndAddr(udpsocket, false)
        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
            // system-dependent error message, do not check
        }
        @Expect(sum, 2)

        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Bind couldn't be invoked twice.")
        }
        @Expect(sum, 3)

        udpsocket.close()
        udpsocket1.close()

        try {
            udpsocket1.bind()
        } catch (e: SocketException) {
            sum += 1
            @Expect(e.message, "Socket is already closed")
        }
        @Expect(sum, 4)
    }
}
