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
    let keepAliveConfig1 = SocketKeepAliveConfig()
    // defaults
    if (keepAliveConfig1.idle != Duration.second * 45) {
        return 2
    }
    if (keepAliveConfig1.interval != Duration.second * 5) {
        return 3
    }
    if (keepAliveConfig1.count != 5) {
        return 4
    }

    let keepAliveConfig2 = SocketKeepAliveConfig(
        idle: Duration.second * 17,
        interval: Duration.minute * 2,
        count: 10
    )
    if (keepAliveConfig2.idle != Duration.second * 17) {
        return 5
    }
    if (keepAliveConfig2.interval != Duration.minute * 2) {
        return 6
    }
    if (keepAliveConfig2.count != 10) {
        return 7
    }

    let keepAliveConfig3 = SocketKeepAliveConfig(
        idle: Duration.second * 15,
        interval: Duration.second * 16,
        count: 17
    )
    if (keepAliveConfig3.idle != Duration.second * 15) {
        return 8
    }
    if (keepAliveConfig3.interval != Duration.second * 16) {
        return 9
    }
    if (keepAliveConfig3.count != 17) {
        return 10
    }

    return 0
}
