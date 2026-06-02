/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows) EXEC: %compiler %cmp_opt -o %n.%suffix %f
// (Windows) RUN-EXEC: %run %run_opt %n.%suffix %run_args

internal import std.net.*

main(): Int64 {
    try {
        let tcpSocket: TcpSocket = TcpSocket("0.0.0.0", 0)
    } catch (e: SocketException) {
        return 0
    }

    return 100
}
