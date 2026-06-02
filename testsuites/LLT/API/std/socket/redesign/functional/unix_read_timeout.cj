/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan timeout1

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

func runUnixServer(socketPath: String) {
    try (serverSocket = UnixServerSocket(bindAt: socketPath)) {
        serverSocket.bind()
        try (client = serverSocket.accept()) {
            client.receiveBufferSize = 2304
            sleep(Duration.second * 4)
        }
    }
}

main(): Int64 {
    let socketPath = createTempFile()
    spawn {
        runUnixServer(socketPath)
    }
    sleep(Duration.second)

    try (socket = UnixSocket(socketPath)) {
        socket.readTimeout = Duration.second
        socket.sendBufferSize = 2304
        socket.connect(timeout: 10 * Duration.second)

        try {
            socket.read(Array<Byte>(10, repeat: 0))
        } catch (e: SocketTimeoutException) {
            println("timeout1")
        }
    }

    return 0
}
