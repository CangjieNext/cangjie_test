/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// EXEC: rm -rf /tmp/testunixdatagram1
// EXEC: rm -rf /tmp/testunixdatagram2

/*
 * Test description: Test the bind and connect
 * Test API: public func bind()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*
import std.fs.*
import std.posix.*

var data = Array<Byte>(5000, repeat: 10)
var sum = 0

@Test
class Test_Unixdatagram_Connect {
    public override func beforeAll(): Unit {
        if (exists("/tmp/testunixdatagram1")) {
            remove("/tmp/testunixdatagram1", recursive: true)
        }
        Directory.create("/tmp/testunixdatagram1")

        if (exists("/tmp/testunixdatagram2")) {
            remove("/tmp/testunixdatagram2", recursive: true)
        }
        Directory.create("/tmp/testunixdatagram2")
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_06(): Unit {
        //reconnect 
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket9")
        unixdatagramsocket1.bind()
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket10")
        unixdatagramsocket2.bind()

        var addr1 = unixdatagramsocket1.localAddress

        try {
            unixdatagramsocket2.connect(addr1)
        } catch (e: SocketException) {
            //@Expect(e.message.contains("not connect"), true)
            println(e.message)
            sum += 1
        }
        @Expect(sum, 0)
        try {
            unixdatagramsocket2.connect(addr1)
        } catch (e: SocketException) {
            @Expect(e.message.contains("already connected"), true)
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }
}
