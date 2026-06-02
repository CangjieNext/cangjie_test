/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

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
var ser = Option<UnixServerSocket>.None

@Test
class Test_Unix_FilePermission {
    public override func beforeAll(): Unit {
        if (exists("./testsocket")) {
            remove("./testsocket", recursive: true)
        }
        Directory.create("./testsocket")
    }

    public override func afterAll(): Unit {
        if (exists("./testsocket")) {
            remove("./testsocket", recursive: true)
        }
    }

    public override func afterEach(): Unit {
        unlink("./testsocket/socket")
    }

    func startServer(): Unit {
        var server = UnixServerSocket(bindAt: "./testsocket/socket")
        server.bind()
        var serversocket = server.accept(timeout: 2 * Duration.second)
        serversocket.write(data)
        ser = Option<UnixServerSocket>.Some(server)
    }

    @TestCase
    func test_with_permission(): Unit {
        spawn {
            startServer()
        }
        sleep(Duration.second)
        var client = UnixSocket("./testsocket/socket")
        client.connect(timeout: 2 * Duration.second)
        var buf = Array<Byte>(5000, repeat: 20)
        client.read(buf) //block
        @Expect(data, buf)
        client.close()
        ser.getOrThrow().close()
    }
}
