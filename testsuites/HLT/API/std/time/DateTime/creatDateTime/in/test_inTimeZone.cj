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

let zone = TimeZone("Asia/Shanghai", Duration.Zero)

@Test
class Test_inTimeZone {
    @TestCase
    func test_inTimeZone_01(): Unit {
        let res = DateTime.UnixEpoch.inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_02(): Unit {
        let res = DateTime.now().inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_03(): Unit {
        let res = DateTime.now(timeZone: TimeZone.Local).inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_04(): Unit {
        let res = DateTime.nowUTC().inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_05(): Unit {
        let duration = Duration.nanosecond
        let res = DateTime.fromUnixTimeStamp(duration).inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_06(): Unit {
        let res = DateTime.ofEpoch(second: 0, nanosecond: 0).inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_07(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.Local)
            .inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_08(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_09(): Unit {
        let res = DateTime
            .ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }

    @TestCase
    func test_inTimeZone_10(): Unit {
        let res = DateTime.parse("2023-04-13T00:00:00+08:00").inTimeZone(zone)
        @Assert(res.zone, zone)
        @Assert(res.zoneId, "Asia/Shanghai")
        @Assert(res.zoneOffset, Duration.Zero)
    }
}
