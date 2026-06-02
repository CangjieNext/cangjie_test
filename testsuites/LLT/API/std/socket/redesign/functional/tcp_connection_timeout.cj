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
// ASSERT: scan timeout

internal import std.net.*
internal import std.time.*
internal import std.sync.*

main(): Int64 {
    try (socket = TcpSocket("8.8.8.8", 34588)) {
        try {
            socket.connect(timeout: Duration.second)
            println("connected")
        } catch (e: SocketTimeoutException) {
            println("timeout")
        }
    }

    return 0
}
