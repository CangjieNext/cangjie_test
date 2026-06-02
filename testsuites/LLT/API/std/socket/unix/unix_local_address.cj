/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test if localAddress and remoteAddress can
 * be get correctly in Unix server or socket
 * Test API: public override prop remoteAddress: SocketAddress
 *           public override prop localAddress: SocketAddress
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

@When[backend == "cjnative"]
func getClientPath(): String {
    return "\0client"
}

@When[backend != "cjnative"]
func getClientPath(): String {
    let address = "./testsocket/client"
    unlink(address)
    return address
}

var ser = Option<UnixServerSocket>.None
var sum = 0

@Test
class Test_Unix_Socket_Address {
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

    func startServer1(): Unit {
        var server = UnixServerSocket(bindAt: "./testsocket/socket")
        server.bind()
        ser = Option<UnixServerSocket>.Some(server)
    }

    // get localAddress in different periods of Unix socket
    @TestCase
    func test_get_address_3(): Unit {
        spawn {
            startServer1()
        }
        sleep(500 * Duration.millisecond)
        var client = UnixSocket("./testsocket/socket")
        client.connect(timeout: 2 * Duration.second)
        @Expect(client.localAddress.toString(), "")

        ser.getOrThrow().close()
        client.close()
    }

    @TestCase
    func test_get_client_address_real(): Unit {
        let clientPath = "./testsocket/client"
        let serverPath = "./testsocket/socket"
        spawn {
            sleep(500 * Duration.millisecond)
            unlink(clientPath)
            let socket = UnixSocket(serverPath, localPath: clientPath)
            socket.connect()
            socket.close()
        }
        let server = UnixServerSocket(bindAt: serverPath)
        server.bind()
        let socket = server.accept()
        @Expect(socket.remoteAddress.toString(), clientPath)
        server.close()
    }

    @TestCase
    func test_get_client_address_abstract(): Unit {
        let clientPath = getClientPath()
        let serverPath = "./testsocket/socket"
        spawn {
            sleep(500 * Duration.millisecond)
            let socket = UnixSocket(serverPath, localPath: clientPath)
            socket.connect()
            socket.close()
        }
        let server = UnixServerSocket(bindAt: serverPath)
        server.bind()
        let socket = server.accept()
        @Expect(socket.remoteAddress.toString(), clientPath)
        server.close()
    }
}
