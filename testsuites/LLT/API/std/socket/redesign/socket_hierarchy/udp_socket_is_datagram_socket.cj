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

main(): Int64 {
    let udpSocket: UdpSocket = UdpSocket(bindAt: 0)

    if (!(udpSocket is DatagramSocket)) {
        return 1
    }

    return 0
}
