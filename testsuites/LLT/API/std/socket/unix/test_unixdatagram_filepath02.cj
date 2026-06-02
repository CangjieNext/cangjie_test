/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args
// EXEC-PIPE-0: ls 123
// EXEC-PIPE-0: ls '#'
// EXEC-PIPE-0: rm 123
// EXEC-PIPE-0: rm '#'

/*
 * Test description: Test the bind and connect
 * Test API: public func close()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*
import std.fs.*
import std.posix.*

var data = Array<Byte>(5000, repeat: 10)
var unixdatagram = Option<UnixDatagramSocket>.None
var sum = 0

@Test
class Test_Unixdatagram_Filepath {
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
    public override func afterAll(): Unit {
        if (exists("/tmp/testunixdatagram1")) {
            remove("/tmp/testunixdatagram1", recursive: true)
        }
        if (exists("/tmp/testunixdatagram2")) {
            remove("/tmp/testunixdatagram2", recursive: true)
        }
    }
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_03(): Unit {
        try (unixdatagramsocket1 = UnixDatagramSocket(bindAt: "123")) {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            //@Expect(e.message.contains("No such file or directory"), true)
            println(e.message)
            sum += 1
        }
        //@Expect(sum, 1)
    }

    @TestCase
    func test_04(): Unit {
        try (unixdatagramsocket1 = UnixDatagramSocket(bindAt: "#")) {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            //@Expect(e.message.contains("No such file or directory"), true)
            println(e.message)
            sum += 1
        }
        println(FileInfo(Path("#")).isRegular())
        //@Expect(sum, 1)
    }
}
