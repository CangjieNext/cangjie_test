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
 * Test API: public func close()
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
var unixdatagram = Option<UnixDatagramSocket>.None
var sum = 0

@Test
class Test_Unixdatagram_Transport01 {
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
    func test_02(): Unit {
        //not bind to sendto and receivefrom
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket1")
        unixdatagramsocket1.bind()

        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket2")
        var addr2 = unixdatagramsocket2.localAddress
        unixdatagramsocket1.sendTimeout = Duration.second

        var buf = Array<Byte>(5000, repeat: 0)
        unixdatagramsocket1.sendBufferSize = 5000
        try {
            unixdatagramsocket1.sendTo(addr2, data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("No such file or directory"), true)
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
        unixdatagramsocket2.receiveTimeout = Duration.second
        try {
            unixdatagramsocket2.receiveFrom(buf)
        } catch (e: SocketException) {
            @Expect(e.message.contains("is not bound"), true)
            println(e.message)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("/tmp/testunixdatagram1/socket1")
        unlink("/tmp/testunixdatagram1/socket2")
    }
}
