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
    func test_01(): Unit {
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/../socket1")
        unixdatagramsocket1.bind()

        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/../socket2")
        unixdatagramsocket2.bind()
        var addr2 = unixdatagramsocket2.localAddress
        unixdatagramsocket1.connect(addr2)
        unlink("/tmp/socket1")
        unlink("/tmp/socket2")
    }

    @TestCase
    func test_02(): Unit {
        try (unixdatagramsocket1 = UnixDatagramSocket(bindAt: "")) {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 0)
    }

    @TestCase
    func test_03(): Unit {
        let f = "123"
        try (unixdatagramsocket1 = UnixDatagramSocket(bindAt: f)) {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            println(e.message)
            sum += 1
        }
        unlink(f)
        @Expect(sum, 0)
    }

    @TestCase
    func test_04(): Unit {
        let f = "#"
        try (unixdatagramsocket1 = UnixDatagramSocket(bindAt: f)) {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            println(e.message)
            sum += 1
        }
        unlink(f)
        @Expect(sum, 0)
    }

    @TestCase
    func test_05(): Unit {
        try (unixdatagramsocket1 = UnixDatagramSocket(bindAt: "/tmp/testunixdatagram1/\0socket\0")) {
            unixdatagramsocket1.bind()
        } catch (e: IllegalArgumentException) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_07(): Unit {
        //test the string length
        var dir = Path("/tmp/testunixdatagram1")
        var dir1 = dir.join(String(Array<Rune>(84, repeat: r'a')))
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: dir1.toString())
        try {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            println(e.message)
            sum += 1
        }
        @Expect(sum, 0)

        var dir2 = dir.join(String(Array<Rune>(85, repeat: r'a')))
        try {
            UnixDatagramSocket(bindAt: dir2.toString())
        } catch (e: SocketException) {
            @Expect(e.message.contains("shorter than 108 bytes"), true)
            sum += 1
        }
        @Expect(sum, 0)
        unixdatagramsocket1.close()
        unlink("/tmp/testunixdatagram1")
    }
}
