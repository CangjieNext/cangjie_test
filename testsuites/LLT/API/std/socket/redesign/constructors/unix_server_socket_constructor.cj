/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_args

internal import std.net.*

main(): Int64 {
    let unixServerSocket1: UnixServerSocket = UnixServerSocket(bindAt: "/tmp/temptest")

    let socketAddres1: SocketAddress = UnixSocketAddress("/tmp/temptest")
    let unixServerSocket2: UnixServerSocket = UnixServerSocket(bindAt: socketAddres1)

    if (!(unixServerSocket1 is ServerSocket) || !(unixServerSocket2 is ServerSocket)) {
        return 1
    }

    try {
        let unixSocket3: UnixServerSocket = UnixServerSocket(bindAt: "/tmp/\0sock123")
        return 1
    } catch (e: IllegalArgumentException) {}

    return 0
}
