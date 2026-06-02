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
internal import std.time.*
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
        try (client = serverSocket.accept()) {}
    }
}

main(): Int64 {
    let socketPath = createTempFile()
    spawn {
        runUnixServer(socketPath)
    }
    sleep(Duration.second)

    try (unixSocket = UnixSocket(socketPath)) {
        unixSocket.connect()

        // remote address
        let ra = unixSocket.remoteAddress

        if (ra.toString() != socketPath) {
            return 3
        }
        if (ra.family != AddressFamily.UNIX) {
            return 4
        }

        // local address
        let la = unixSocket.localAddress
        if (la.family != AddressFamily.UNIX) {
            return 5
        }

        return 0
    }

    return 100
}
