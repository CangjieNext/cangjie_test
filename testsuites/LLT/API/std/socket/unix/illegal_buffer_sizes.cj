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
class Test_Unixdatagram_Transportbuffer {
    public override func beforeAll(): Unit {
        if (exists("/tmp/testunixdatagram1")) {
            remove("/tmp/testunixdatagram1", recursive: true)
        }
        Directory.create("/tmp/testunixdatagram1")
    }
    public override func afterAll(): Unit {
        if (exists("/tmp/testunixdatagram1")) {
            remove("/tmp/testunixdatagram1", recursive: true)
        }
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_09(): Unit {
        //buffer set,socket2 not is closed
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket1")
        unixdatagramsocket1.bind()
        var addr1 = unixdatagramsocket1.localAddress

        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/socket2")
        unixdatagramsocket2.bind()
        var addr2 = unixdatagramsocket2.localAddress
        unixdatagramsocket1.sendBufferSize = 5000
        unixdatagramsocket1.sendTimeout = 100 * Duration.millisecond

        unixdatagramsocket1.connect(addr2)
        unixdatagramsocket2.connect(addr1)
        try {
            unixdatagramsocket2.receiveBufferSize = 0
        } catch (e: IllegalArgumentException) {
            sum += 1
            @Expect(e.message.contains("Buffer size should be positive, got 0"), true)
            println(e.message)
        }

        try {
            unixdatagramsocket2.receiveBufferSize = -5
        } catch (e: IllegalArgumentException) {
            sum += 1
            @Expect(e.message.contains("Buffer size should be positive, got -5"), true)
            println(e.message)
        }

        try {
            unixdatagramsocket2.sendBufferSize = 0
        } catch (e: IllegalArgumentException) {
            sum += 1
            @Expect(e.message.contains("Buffer size should be positive, got 0"), true)
            println(e.message)
        }

        try {
            unixdatagramsocket2.sendBufferSize = -100
        } catch (e: IllegalArgumentException) {
            sum += 1
            @Expect(e.message.contains("Buffer size should be positive, got -100"), true)
            println(e.message)
        }

        unixdatagramsocket2.receiveTimeout = Duration.Zero
        var buf = Array<Byte>(5000, repeat: 0)

        unixdatagramsocket1.sendBufferSize = 6000
        unixdatagramsocket2.receiveBufferSize = 6000
        unixdatagramsocket1.send(data)
        unixdatagramsocket2.receiveFrom(buf)

        @Expect(sum, 4)
        @Expect(buf, data)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("/tmp/testunixdatagram1/socket1")
        unlink("/tmp/testunixdatagram1/socket2")
    }
}
