/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Test_zoneId {
    @TestCase
    func test_zoneId_01(): Unit {
        var flag: Bool
        let res = DateTime.UnixEpoch.zoneId
        @Assert(res, "UTC")
    }

    @TestCase
    func test_zoneId_02(): Unit {
        var flag: Bool
        var timezone = TimeZone("Asia/Shanghai", Duration.Zero)
        let res = DateTime.now(timeZone: timezone).zoneId
        @Assert(res, "Asia/Shanghai")
    }

    @TestCase
    func test_zoneId_03(): Unit {
        var flag: Bool
        let res = DateTime.now(timeZone: TimeZone.UTC).zoneId
        @Assert(res, "UTC")
    }

    @TestCase
    func test_zoneId_04(): Unit {
        var flag: Bool
        let res = DateTime.nowUTC().zoneId
        @Assert(res, "UTC")
    }

    @TestCase
    func test_zoneId_05(): Unit {
        var flag: Bool
        let duration = Duration.nanosecond
        let res = DateTime.fromUnixTimeStamp(duration).zoneId
        @Assert(res, "UTC")
    }

    @TestCase
    func test_zoneId_06(): Unit {
        var flag: Bool
        let res = DateTime.ofEpoch(second: 0, nanosecond: 0).zoneId
        @Assert(res, "UTC")
    }

    @TestCase
    func test_zoneId_07(): Unit {
        var flag: Bool
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .zoneId
        @Assert(res, "UTC")
    }

    @TestCase
    func test_zoneId_08(): Unit {
        var flag: Bool
        var timezone = TimeZone("Asia/Shanghai", Duration.Zero)
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: timezone)
            .zoneId
        @Assert(res, "Asia/Shanghai")
    }

    @TestCase
    func test_zoneId_09(): Unit {
        var flag: Bool
        let res = DateTime
            .ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .zoneId
        @Assert(res, "UTC")
    }

    @TestCase
    func test_zoneId_10(): Unit {
        var flag: Bool
        let res = DateTime.parse("2023-04-13T00:00:00Z").zoneId
        @Assert(res, "GMT")
    }
}
