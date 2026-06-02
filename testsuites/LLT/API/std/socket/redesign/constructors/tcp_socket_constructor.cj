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
    let tcpSocket1: TcpSocket = TcpSocket("127.0.0.1", 0)

    let socketAddress1: SocketAddress = IPSocketAddress("127.0.0.1", 0)
    let tcpSocket2: TcpSocket = TcpSocket(socketAddress1)

    let socketAddress2: SocketAddress = IPSocketAddress([127u8, 0u8, 0u8, 1u8], 0)
    let tcpSocket3: TcpSocket = TcpSocket(socketAddress2)

    let tcpSocket4: TcpSocket = TcpSocket(socketAddress2, localAddress: socketAddress1)

    return 0
}
