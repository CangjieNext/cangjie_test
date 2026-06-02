/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args
// ASSERT: scan IllegalArgumentException

internal import std.net.*

main(): Int64 {
    try {
        var sa: SocketAddress = IPSocketAddress("0:0:0:0:0:ffff:192.1.56.10", 10240)
        println(true)
    } catch (e: Exception) {
        e.printStackTrace()
    }

    return 0
}
