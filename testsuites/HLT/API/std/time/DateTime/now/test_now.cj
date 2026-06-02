/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Test_now {
    @TestCase
    func test_now_01(): Unit {
        let now = DateTime.now()
        let nowZone = now.zone
        @Assert(nowZone, TimeZone.Local)
    }

    @TestCase
    func test_now_02(): Unit {
        let zone = TimeZone("Asia/Shanghai", Duration.Zero)
        let now = DateTime.now(timeZone: zone)
        @Assert(now.zone, zone)
        @Assert(now.zoneId, "Asia/Shanghai")
        @Assert(now.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_now_03(): Unit {
        let now = DateTime.now(timeZone: TimeZone.UTC)
        let nowZone = now.zone
        let nowUTC = DateTime.nowUTC()
        @Assert(nowZone, TimeZone.UTC)
    }

    @TestCase
    func test_now_04(): Unit {
        let now = DateTime.now(timeZone: TimeZone.Local)
        let nowZone = now.zone
        let nowUTC = DateTime.nowUTC()
        @Assert(nowZone, TimeZone.Local)
    }
}
