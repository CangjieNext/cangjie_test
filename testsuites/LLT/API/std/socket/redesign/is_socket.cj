/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan unixserver is socket
// ASSERT: scan unixdatagram is socket

internal import std.net.*
internal import std.fs.*
internal import std.random.*
internal import std.posix.*
internal import std.process.*

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

main(): Int64 {
    let serverPath = createTempFile()
    let datagramPath = createTempFile()

    try (serverSocket = UnixServerSocket(bindAt: serverPath)) {
        serverSocket.bind()

        if (isSock(serverPath)) {
            println("unixserver is socket")
        }
    }

    try (datagramSocket = UnixDatagramSocket(bindAt: datagramPath)) {
        datagramSocket.bind()

        if (isSock(datagramPath)) {
            println("unixdatagram is socket")
        }
    }

    return 0
}
