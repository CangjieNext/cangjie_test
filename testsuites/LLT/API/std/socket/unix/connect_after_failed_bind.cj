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
import std.fs.*

var sum = 0

@Test
class Test_Connect_After_Failed_Build {
    public override func beforeEach(): Unit {
        sum = 0
    }

    public override func beforeAll(): Unit {
        if (exists("/tmp/testunixdatagram1")) {
            remove("/tmp/testunixdatagram1", recursive: true)
        }
        Directory.create("/tmp/testunixdatagram1")
    }

    @TestCase
    func test_datagram(): Unit {
        var unixdatagramsocket0_1 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket0_1")
        unixdatagramsocket0_1.bind()
        var unixdatagramsocket0_2 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket0_2")
        unixdatagramsocket0_2.bind()

        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket1")
        unixdatagramsocket1.bind()
        var unixdatagramsocket1_2 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket1")
        try {
            unixdatagramsocket1_2.bind()
            @Expect(false)
        } catch (e: SocketException) {}
        unixdatagramsocket1.connect(unixdatagramsocket0_1.localAddress)

        try {
            unixdatagramsocket1_2.connect(unixdatagramsocket0_2.localAddress)
            @Expect(false)
        } catch (e: Exception) {
            @Expect("The bind of the socket has failed.", e.message)
        }
    }
}
