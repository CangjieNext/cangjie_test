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

main(): Int64 {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        if (serverSocket.sendBufferSize <= 0) {
            return 2
        }
        serverSocket.sendBufferSize = 2304

        if (serverSocket.receiveBufferSize <= 0) {
            return 3
        }
        serverSocket.receiveBufferSize = 4000

        return 0
    }

    return 100
}
