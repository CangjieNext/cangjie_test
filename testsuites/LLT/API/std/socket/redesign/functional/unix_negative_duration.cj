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
import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.random.*
import std.process.*

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

let d = -0.1 * Duration.millisecond

@Test
class TestNegativeDuration {
    func shouldThrow(action: () -> Unit): Unit {
        try {
            action()
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("duration cannot be negative"))
        }
    }

    @TestCase
    func test_unix_datagram(): Unit {
        let unixDatagram = UnixDatagramSocket(bindAt: createTempFile())
        shouldThrow {
            unixDatagram.receiveTimeout = d
        }
        shouldThrow {
            unixDatagram.sendTimeout = d
        }
    }

    @TestCase
    func test_unix_server(): Unit {
        let unixServer = UnixServerSocket(bindAt: createTempFile())
        unixServer.bind()
        shouldThrow {
            unixServer.accept(timeout: d)
        }
    }

    @TestCase
    func test_unix(): Unit {
        let unix = UnixSocket(createTempFile())
        shouldThrow {
            unix.readTimeout = d
        }
        shouldThrow {
            unix.writeTimeout = d
        }
        shouldThrow {
            unix.connect(timeout: d)
        }
    }
}
