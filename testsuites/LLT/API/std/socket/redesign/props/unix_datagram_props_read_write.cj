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

main(): Int64 {
    try (unixSocket = UnixDatagramSocket(bindAt: createTempFile())) {
        // receiveTimeout
        if (unixSocket.receiveTimeout != None<Duration>) {
            return 2
        }
        unixSocket.receiveTimeout = Some(Duration.second)
        if (unixSocket.receiveTimeout != Some(Duration.second)) {
            return 3
        }

        // sendTimeout
        if (unixSocket.sendTimeout != None<Duration>) {
            return 4
        }
        unixSocket.sendTimeout = Some(Duration.second)
        if (unixSocket.sendTimeout != Some(Duration.second)) {
            return 5
        }

        if (unixSocket.sendBufferSize <= 0) {
            return 6
        }
        unixSocket.sendBufferSize = 2304

        if (unixSocket.receiveBufferSize <= 0) {
            return 7
        }
        unixSocket.receiveBufferSize = 2304

        return 0
    }

    return 100
}
