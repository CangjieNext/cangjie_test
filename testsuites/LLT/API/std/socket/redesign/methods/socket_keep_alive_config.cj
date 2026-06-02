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
internal import std.time.*

main(): Int64 {
    let keepAliveConfig1: SocketKeepAliveConfig = SocketKeepAliveConfig(
        idle: Duration.second * 7,
        interval: Duration.second * 123,
        count: 5
    )

    let keepAliveConfig2: SocketKeepAliveConfig = SocketKeepAliveConfig(
        idle: Duration.second * 7,
        interval: Duration.second * 123,
        count: 5
    )

    if (keepAliveConfig1 != keepAliveConfig2) {
        return 2
    }

    // String representation
    let actual = keepAliveConfig1.toString()
    let expected = "SocketKeepAliveConfig(idle: 7s, interval: 2m3s, count: 5)"
    if (actual != expected) {
        return 3
    }

    return 0
}
