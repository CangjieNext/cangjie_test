/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan server received
// ASSERT: scan client address correct

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

func runUnixDatagramServer(serverPath: String, clientPath: String) {
    try (serverSocket = UnixDatagramSocket(bindAt: serverPath)) {
        serverSocket.bind()

        let buf = Array<Byte>(3, repeat: 0)

        let (clientAddr, read) = serverSocket.receiveFrom(buf)

        if (read == 3 && buf == [1u8, 2u8, 3u8]) {
            println("server received")
        }
        if (clientAddr.toString() == clientPath) {
            println("client address correct")
        }
    }
}

main(): Int64 {
    let clientPath = createTempFile()
    let serverPath = createTempFile()
    spawn {
        runUnixDatagramServer(serverPath, clientPath)
    }
    sleep(Duration.second)

    try (unixSocket = UnixDatagramSocket(bindAt: clientPath)) {
        unixSocket.sendTimeout = Duration.second * 2
        unixSocket.bind()
        unixSocket.connect(serverPath)

        unixSocket.send([1u8, 2u8, 3u8])

        sleep(Duration.millisecond * 300)
    }

    return 0
}
