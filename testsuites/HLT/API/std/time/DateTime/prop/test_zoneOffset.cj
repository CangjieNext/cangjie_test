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
class Test_zoneOffset {
    @TestCase
    func test_zoneOffset_01(): Unit {
        var flag: Bool
        let res = DateTime.UnixEpoch.zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_02(): Unit {
        var flag: Bool
        let res = DateTime.now(timeZone: TimeZone.UTC).zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_03(): Unit {
        var flag: Bool
        let res = DateTime.now(timeZone: TimeZone.UTC).zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_04(): Unit {
        var flag: Bool
        let res = DateTime.nowUTC().zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_05(): Unit {
        var flag: Bool
        let duration = Duration.nanosecond
        let res = DateTime.fromUnixTimeStamp(duration).zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_06(): Unit {
        var flag: Bool
        let res = DateTime.ofEpoch(second: 0, nanosecond: 0).zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_07(): Unit {
        var flag: Bool
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_08(): Unit {
        var flag: Bool
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_09(): Unit {
        var flag: Bool
        let res = DateTime
            .ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .zoneOffset
        @Assert(res, Duration.Zero)
    }

    @TestCase
    func test_zoneOffset_10(): Unit {
        var flag: Bool
        let res = DateTime.parse("2023-04-13T00:00:00Z").zoneOffset
        @Assert(res, Duration.Zero)
    }
}
