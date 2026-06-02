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

func runUnixDatagramServer(serverPath: String) {
    try (serverSocket = UnixDatagramSocket(bindAt: serverPath)) {
        serverSocket.bind()
        sleep(Duration.minute)
    }
}

main(): Int64 {
    let clientPath = createTempFile()
    let serverPath = createTempFile()
    spawn {
        runUnixDatagramServer(serverPath)
    }
    sleep(Duration.second)

    try (unixSocket = UnixDatagramSocket(bindAt: clientPath)) {
        var sum = 0
        try {
            unixSocket.remoteAddress
        } catch (e: SocketException) {
            sum += 1
        }
        if (sum != 1) {
            return 2
        }
        unixSocket.bind()
        unixSocket.connect(serverPath)

        // remote address
        if (let Some(ra) <- unixSocket.remoteAddress) {
            if (ra.toString() != serverPath) {
                return 4
            }
        } else {
            return 6
        }

        // local address
        let la = unixSocket.localAddress
        println(la)
        println(clientPath)

        if (la.toString() != clientPath) {
            return 8
        }
        if (la.family != AddressFamily.UNIX) {
            return 9
        }

        return 0
    }

    return 10
}
