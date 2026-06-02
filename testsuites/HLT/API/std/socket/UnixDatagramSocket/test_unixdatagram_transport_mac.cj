/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (MAC)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (MAC)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

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
class Test_Unixdatagram_Transport01 {
    public override func beforeAll(): Unit {
        if (exists("./testunixdatagram1")) {
            remove("./testunixdatagram1", recursive: true)
        }
        Directory.create("./testunixdatagram1")

        if (exists("./testunixdatagram2")) {
            remove("./testunixdatagram2", recursive: true)
        }
        Directory.create("./testunixdatagram2")
    }
    public override func afterAll(): Unit {
        if (exists("./testunixdatagram1")) {
            remove("./testunixdatagram1", recursive: true)
        }
        if (exists("./testunixdatagram2")) {
            remove("./testunixdatagram2", recursive: true)
        }
    }
    public override func beforeEach(): Unit {
        sum = 0
    }

    @TestCase
    func test_01(): Unit {
        //not bind to sendto and receivefrom
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        var addr2 = unixdatagramsocket2.localAddress
        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.sendTo(addr2, data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("is not bound"), true)
            sum += 1
        }
        @Expect(sum, 1)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }

    @TestCase
    func test_02(): Unit {
        //not bind to sendto and receivefrom
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        unixdatagramsocket1.bind()
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        var addr2 = unixdatagramsocket2.localAddress
        unixdatagramsocket1.sendTimeout = Duration.second

        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.sendTo(addr2, data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Message too long") || e.message.contains("Failed to write data"), true)
            sum += 1
        }
        @Expect(sum, 1)
        unixdatagramsocket2.receiveTimeout = Duration.second
        try {
            unixdatagramsocket2.receiveFrom(buf)
        } catch (e: SocketException) {
            @Expect(e.message.contains("is not bound"), true)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }

    @TestCase
    func test_03(): Unit {
        //not bind to sendto and receivefrom
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        unixdatagramsocket2.bind()
        var addr2 = unixdatagramsocket2.localAddress
        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.sendTo(addr2, data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("not bound"), true)
            sum += 1
        }
        @Expect(sum, 1)
        unixdatagramsocket2.receiveTimeout = Duration.second
        try {
            unixdatagramsocket2.receiveFrom(buf)
        } catch (e: SocketTimeoutException) {
            @Expect(e.message.contains("out"), true)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }

    @TestCase
    func test_05(): Unit {
        //not bind to send and receive
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        var addr2 = unixdatagramsocket2.localAddress
        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.send(data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 1)
        try {
            unixdatagramsocket2.receive(buf)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }

    @TestCase
    func test_06(): Unit {
        //not bind to send and receive
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        unixdatagramsocket1.bind()
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        var addr2 = unixdatagramsocket2.localAddress
        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.send(data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 1)
        try {
            unixdatagramsocket2.receive(buf)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }

    @TestCase
    func test_07(): Unit {
        //not bind to send and receive
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        unixdatagramsocket2.bind()
        var addr2 = unixdatagramsocket2.localAddress
        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.send(data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 1)
        try {
            unixdatagramsocket2.receive(buf)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }

    @TestCase
    func test_08(): Unit {
        //bind to send and receive
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        unixdatagramsocket1.bind()
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        unixdatagramsocket2.bind()
        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.send(data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 1)
        try {
            unixdatagramsocket2.receive(buf)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }

    @TestCase
    func test_09(): Unit {
        // one connect to send and receive
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        unixdatagramsocket1.bind()
        var addr1 = unixdatagramsocket1.localAddress

        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        unixdatagramsocket2.bind()
        unixdatagramsocket2.connect(addr1)
        unixdatagramsocket1.sendTimeout = Duration.second

        var buf = Array<Byte>(5000, repeat: 0)
        try {
            unixdatagramsocket1.send(data)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is not connected"), true)
            sum += 1
        }
        @Expect(sum, 1)

        unixdatagramsocket2.receiveTimeout = Duration.second
        try {
            unixdatagramsocket2.receive(buf)
        } catch (e: SocketTimeoutException) {
            @Expect(e.message.contains("time"), true)
            sum += 1
        }
        @Expect(sum, 2)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
        unlink("./testunixdatagram1/socket1")
        unlink("./testunixdatagram1/socket2")
    }
}
