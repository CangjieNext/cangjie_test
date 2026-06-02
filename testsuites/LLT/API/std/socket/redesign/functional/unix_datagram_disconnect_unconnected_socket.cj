/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.fs.*
import std.random.*
import std.process.*

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

@Test
class Test_UnixDatagram_Disconnect_Unconnected {
    @TestCase
    func test_disconnect_after_bind(): Unit {
        var udSocket = UnixDatagramSocket(bindAt: createTempFile())
        udSocket.bind()
        try {
            udSocket.disconnect()
            udSocket.disconnect()
            udSocket.disconnect()
            @Assert(true)
        } catch (e: SocketException) {
            @Assert(false)
        }
        udSocket.close()
    }

    @TestCase
    func test_disconnect_before_bind(): Unit {
        var udSocket = UnixDatagramSocket(bindAt: createTempFile())
        try {
            udSocket.disconnect()
            @Assert(false)
        } catch (e: SocketException) {
            @Expect(e.message, "The socket is not bound: invoke bind() first.")
        }
        udSocket.close()
    }

    @TestCase
    func test_disconnect_after_close(): Unit {
        var udSocket = UnixDatagramSocket(bindAt: createTempFile())

        udSocket.bind()
        udSocket.close()

        try {
            udSocket.disconnect()
            @Assert(false)
        } catch (e: SocketException) {
            @Expect(e.message, "Socket is already closed")
        }
    }
}
