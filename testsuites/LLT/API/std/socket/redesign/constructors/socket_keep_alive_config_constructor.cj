/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.time.*

@Test
func testConfigSuccess(): Unit {
    let _ = SocketKeepAliveConfig(
        idle: Duration.second,
        interval: Duration.second,
        count: 5
    )

    let _ = SocketKeepAliveConfig(count: 5)

    let _ = SocketKeepAliveConfig(
        idle: Duration.second * 10,
        interval: Duration.second,
        count: 5
    )

    let _ = SocketKeepAliveConfig()
}

@Test
func testConfigException(): Unit {
    try {
        SocketKeepAliveConfig(interval: Duration.second * -1)
        @Assert(false)
    } catch (e: Exception) {
        @Expect(!e.message.contains("duration duration"))
    }
    try {
        SocketKeepAliveConfig(idle: Duration.second * -1)
        @Assert(false)
    } catch (e: Exception) {
        @Expect(!e.message.contains("duration duration"))
    }
}
