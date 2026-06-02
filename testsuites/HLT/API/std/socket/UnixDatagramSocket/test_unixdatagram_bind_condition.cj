/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: export USER=`whoami` && %run %run_opt %output %run_utest_opt %run_args

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
import std.process.*
import std.posix.*

var data = Array<Byte>(5000, repeat: 10)
var sum = 0
var user = Option<String>.None

@Test
class Test_Unixdatagram_Bind {
    public override func beforeAll(): Unit {
        if (exists("./testunixdatagram1")) {
            remove("./testunixdatagram1", recursive: true)
        }
        Directory.create("./testunixdatagram1")

        if (exists("./testunixdatagram2")) {
            remove("./testunixdatagram2", recursive: true)
        }
        Directory.create("./testunixdatagram2")

        user = Process.current.getEnv("USER")
    }

    public override func beforeEach(): Unit {
        sum = 0
    }

    public override func afterAll(): Unit {
        if (exists("./testunixdatagram1")) {
            remove("./testunixdatagram1", recursive: true)
        }
        if (exists("./testunixdatagram2")) {
            remove("./testunixdatagram2", recursive: true)
        }
    }

    @TestCase
    func test_01(): Unit {
        //bind same file under same paths
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket1")
        unixdatagramsocket1.bind()
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: UnixSocketAddress("./testunixdatagram1/socket1"))
        try {
            unixdatagramsocket2.bind()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Address already in use") || e.message.contains("Address in use"), true)
            sum += 1
        }
        @Expect(sum, 1)

        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
    }

    @TestCase
    func test_02(): Unit {
        //bind same file under different paths
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket2")
        unixdatagramsocket1.bind()
        var unixdatagramsocket2 = UnixDatagramSocket(bindAt: "./testunixdatagram2/socket2")
        try {
            unixdatagramsocket2.bind()
        } catch (e: SocketException) {
            sum += 1
        }
        @Expect(sum, 0)
        unixdatagramsocket1.close()
        unixdatagramsocket2.close()
    }

    @TestCase
    func test_03(): Unit {
        //bind a close unixdatagramsocket 
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket3")
        unixdatagramsocket1.close()
        try {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
            println(e.message)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_04(): Unit {
        //test rebind
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket4")
        unixdatagramsocket1.bind()
        try {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            @Expect(e.message.contains("already"), true)
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_05(): Unit {
        //test rebind
        @Assert(exists("./testunixdatagram1"), true)
        @Assert(exists("./testunixdatagram2"), true)
        var unixdatagramsocket1 = UnixDatagramSocket(bindAt: "./testunixdatagram1/socket5")
        var dirinfo = FileInfo("./testunixdatagram1")
        @Expect(dirinfo.setExecutable(false), true)
        try {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            @Expect(e.message.contains("Permission denied"), true)
            println(e.message)
            sum += 1
        }
        match (user) {
            case Some("root") => @Expect(sum, 0)
            case None => @Expect(sum, 0)
            case _ => @Expect(sum, 1)
        }
        @Expect(dirinfo.setExecutable(true), true)
        try {
            unixdatagramsocket1.bind()
        } catch (e: SocketException) {
            println(e.message)
            sum += 1
        }
        match (user) {
            case Some("root") => @Expect(sum, 1)
            case _ => @Expect(sum, 2)
        }
        unixdatagramsocket1.close()
    }
}
