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

@When[os == "Windows"]
foreign func _unlink(filename: CPointer<Byte>): Int32

@When[os == "Windows"]
func unlink(filename: String): Int32 {
    unsafe {
        let cph = acquireArrayRawData(filename.rawData())
        let ret = _unlink(cph.pointer)
        releaseArrayRawData(cph)
        return ret
    }
}

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
    func test_05(): Unit {
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket8")

        try {
            unixdatagramsocket2.disconnect()
        } catch (e: SocketException) {
            @Expect(e.message.contains("not bound"), true)
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
        unixdatagramsocket2.close()
        unlink("/tmp/testunixdatagram1/socket7")
        unlink("/tmp/testunixdatagram1/socket8")
    }
}
