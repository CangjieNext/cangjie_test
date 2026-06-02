/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.net.*
internal import std.fs.*
internal import std.random.*
internal import std.process.*

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

main(): Int64 {
    let socketPath = createTempFile()

    try (serverSocket = UnixServerSocket(bindAt: socketPath)) {
        // localAddress
        let la = serverSocket.localAddress
        if (la.toString() != socketPath) {
            return 2
        }
        // backlog size
        serverSocket.backlogSize = 11
        if (serverSocket.backlogSize != 11) {
            return 4
        }

        serverSocket.bind()

        if (serverSocket.sendBufferSize <= 0) {
            return 5
        }
        serverSocket.sendBufferSize = 2304

        if (serverSocket.receiveBufferSize <= 0) {
            return 6
        }
        serverSocket.receiveBufferSize = 2304

        return 0
    }

    return 100
}
