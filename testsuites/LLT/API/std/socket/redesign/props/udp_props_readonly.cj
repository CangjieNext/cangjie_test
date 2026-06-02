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
internal import std.sync.*

main(): Int64 {
    let localPort: UInt16 = 43563
    try (udpSocket = UdpSocket(bindAt: localPort)) {
        // remote address
        var sum = 0
        try {
            udpSocket.remoteAddress
        } catch (e: SocketException) {
            sum += 1
        }
        if (sum != 1) {
            return 2
        }

        // localAddress
        let la = udpSocket.localAddress
        if (la.toString() != "0.0.0.0:${localPort}") {
            return 3
        }

        return 0
    }

    return 6
}
