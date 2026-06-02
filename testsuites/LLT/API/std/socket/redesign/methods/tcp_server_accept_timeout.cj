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
internal import std.random.*

main(): Int64 {
    try (server = TcpServerSocket(bindAt: 0)) {
        server.bind()
        server.accept(timeout: Duration.second * 2)
    } catch (e: SocketTimeoutException) {
        return 0
    }

    return 1
}
