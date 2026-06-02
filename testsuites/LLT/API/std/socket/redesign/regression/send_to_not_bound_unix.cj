/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.fs.*
import std.random.*
import std.posix.*
import std.time.*
import std.sync.*
import std.process.*

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

main() {
    let datagramPath = createTempFile()
    let datagramSocket = UnixDatagramSocket(bindAt: datagramPath)
    var data = Array<Byte>(1, repeat: 1)
    var wasThrown = false

    try {
        datagramSocket.sendTo(UnixSocketAddress(createTempFile()), data)
    } catch (e: SocketException) {
        wasThrown = true
    }
    assertEqual("Expected:", "Actual:", true, wasThrown)
    datagramSocket.close()
}
