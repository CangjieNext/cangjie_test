/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not connected
// ASSERT: scan failed
internal import std.net.*
internal import std.time.*
internal import std.sync.*
internal import std.fs.*
internal import std.random.*
internal import std.process.*

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

func runUnixServer(serverPath: String) {
    try (serverSocket = UnixServerSocket(bindAt: serverPath)) {
        serverSocket.backlogSize = 1
        serverSocket.bind()
        sleep(Duration.second * 5)
    }
}

func runUnixClient(serverPath: String) {
    try (socket = UnixSocket(serverPath)) {
        socket.connect()
    }
}

main(): Int64 {
    let serverPath = createTempFile()
    spawn {
        runUnixServer(serverPath)
    }
    sleep(Duration.millisecond * 300)
    // occupy backlog
    spawn {
        runUnixClient(serverPath)
    }
    spawn {
        runUnixClient(serverPath)
    }
    sleep(Duration.millisecond * 300)
    // No fit in backlog
    try (socket = UnixSocket(serverPath)) {
        try {
            socket.connect(timeout: Duration.second)
            println("connected")
        } catch (e: SocketException) {
            println("failed")
        }
    }

    return 0
}
