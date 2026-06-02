/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*
import std.time.*
import std.sync.*
import std.fs.*
import std.random.*
import std.unittest.*
import std.unittest.testmacro.*
import std.process.*

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory
    let index: String = Random().nextUInt64().toString()
    return tempDir.join("tmp${index}").toString()
}

var ser = Option<UnixServerSocket>.None

@Test
class TestUnixServer {
    func startServer(serverPath: String): Unit {
        var server = UnixServerSocket(bindAt: serverPath)
        server.bind()
        ser = Option<UnixServerSocket>.Some(server)
        try {
            server.accept().close()
        } catch (e: SocketException) {
            @Assert(e.toString(), "should accept successfully") // Server should accept client1 connection
        }
        try {
            server.accept()
            @Assert("", "shouldn't accept") // Server should be closed while client2 is waiting for connection
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
        }
    }

    @TestCase
    func test_server_closed(): Unit {
        let serverPath = createTempFile()
        spawn {
            startServer(serverPath)
        }

        sleep(Duration.second)

        var client1 = UnixSocket(serverPath)
        client1.connect()
        client1.close()

        // this sleep is required otherwise the first accept() may fail
        sleep(400 * Duration.millisecond)
        ser.getOrThrow().close()

        // wait for server socket shutdown
        sleep(400 * Duration.millisecond)

        var client2 = UnixSocket(serverPath)
        try {
            client2.connect()
            @Assert(false) // should not have connect success
        } catch (e: SocketException) {
            @Expect(e.message.contains("Connection refused"))
        }
        client1.close()
    }
}
