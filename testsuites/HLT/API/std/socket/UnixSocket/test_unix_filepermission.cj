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
 * Test description: Test the filepermission in creating or changing socket files
 * Test API:  Apis in Class UnixServerSocket & UnixSocket
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
var ser = Option<UnixServerSocket>.None
var user = Option<String>.None
var bound = AtomicUInt16(0)

@Test
class Test_Unix_FilePermission {
    public override func beforeAll(): Unit {
        if (exists("./testsocket")) {
            remove("./testsocket", recursive: true)
        }
        Directory.create("./testsocket")

        user = Process.current.getEnv("USER")
    }

    public override func afterAll(): Unit {
        if (exists("./testsocket")) {
            remove("./testsocket", recursive: true)
        }
    }

    public override func afterEach(): Unit {
        unlink("./testsocket/socket")
        bound = AtomicUInt16(0)
    }

    func startServer(): Unit {
        var server = UnixServerSocket(bindAt: "./testsocket/socket")
        server.bind()
        bound.fetchAdd(1)
        var serversocket = server.accept(timeout: 2 * Duration.second)
        serversocket.write(data)
        ser = Option<UnixServerSocket>.Some(server)
    }

    @TestCase
    func test_with_permission(): Unit {
        @Assert(exists("./testsocket"), true)
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var client = UnixSocket("./testsocket/socket")
        client.connect(timeout: 2 * Duration.second)
        var buf = Array<Byte>(5000, repeat: 20)
        client.read(buf)
        @Expect(data, buf)
        client.close()
        ser.getOrThrow().close()
    }

    @TestCase
    func test_no_permission_1(): Unit {
        @Assert(exists("./testsocket"), true)
        var dirinfo = FileInfo("./testsocket")
        @Expect(dirinfo.setReadable(false), true)

        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var client = UnixSocket("./testsocket/socket")
        client.connect(timeout: 2 * Duration.second)
        var buf = Array<Byte>(5000, repeat: 20)
        client.read(buf)
        @Expect(data, buf)
        client.close()
        ser.getOrThrow().close()

        @Expect(dirinfo.setReadable(true), true)
    }

    @TestCase
    func test_no_permission_2(): Unit {
        @Assert(exists("./testsocket"), true)
        match (user) {
            case Some("root") => ()
            case _ =>
                var dirinfo = FileInfo("./testsocket")
                @Expect(dirinfo.setWritable(false), true)

                var sum = 0
                var server = UnixServerSocket(bindAt: "./testsocket/socket")
                try {
                    server.bind()
                } catch (e: SocketException) {
                    sum += 1
                }

                var client = UnixSocket("./testsocket/socket")
                try {
                    client.connect(timeout: 2 * Duration.second)
                } catch (e: SocketException) {
                    sum += 1
                }
                client.close()
                server.close()

                @Expect(sum, 2)
                @Expect(dirinfo.setWritable(true), true)
        }
    }

    @TestCase
    func test_no_permission_3(): Unit {
        @Assert(exists("./testsocket"), true)
        match (user) {
            case Some("root") => ()
            case _ =>
                var dirinfo = FileInfo("./testsocket")
                @Expect(dirinfo.setExecutable(false), true)

                var sum = 0
                var server = UnixServerSocket(bindAt: "./testsocket/socket")
                try {
                    server.bind()
                } catch (e: SocketException) {
                    sum += 1
                }

                var client = UnixSocket("./testsocket/socket")
                try {
                    client.connect(timeout: 2 * Duration.second)
                } catch (e: SocketException) {
                    sum += 1
                }
                client.close()
                server.close()

                @Expect(sum, 2)
                @Expect(dirinfo.setExecutable(true), true)
        }
    }

    @TestCase
    func test_change_permission_1(): Unit {
        @Assert(exists("./testsocket"), true)
        spawn {
            startServer()
        }
        while (!bound.compareAndSwap(1, 0)) {
            sleep(Duration.millisecond)
        }
        var client = UnixSocket("./testsocket/socket")
        client.connect(timeout: 2 * Duration.second)

        var dirinfo = FileInfo("./testsocket")
        @Expect(dirinfo.setExecutable(false), true)
        @Expect(dirinfo.setWritable(false), true)

        var buf = Array<Byte>(5000, repeat: 20)
        client.read(buf)
        @Expect(data, buf)

        client.close()
        ser.getOrThrow().close()

        @Expect(dirinfo.setExecutable(true), true)
        @Expect(dirinfo.setWritable(true), true)
    }
}
