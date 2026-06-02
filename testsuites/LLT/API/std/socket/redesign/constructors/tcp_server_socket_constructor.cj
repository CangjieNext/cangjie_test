/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan Unable to parse IP
// ASSERT: scan true

internal import std.net.*

main(): Int64 {
    let tcpServerSocket1: TcpServerSocket = TcpServerSocket(bindAt: 0)

    if (!(tcpServerSocket1 is ServerSocket)) {
        return 1
    }

    try {
        let socketAddress1: SocketAddress = IPSocketAddress("", 0)
        let tcpServerSocket2: TcpServerSocket = TcpServerSocket(bindAt: socketAddress1)
    } catch (e: IllegalFormatException) {
        println(e.message)
    }

    let socketAddress2: SocketAddress = IPSocketAddress([8u8, 8u8, 8u8, 8u8], 0)
    let tcpServerSocket3: TcpServerSocket = TcpServerSocket(bindAt: socketAddress2)

    println(true)
    return 0
}
