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
class Test_zone {
    @TestCase
    func test_zone_01(): Unit {
        var flag: Bool
        let res = DateTime.UnixEpoch.zone
        if (res == TimeZone.UTC) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_02(): Unit {
        var flag: Bool
        let res = DateTime.now().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_03(): Unit {
        var flag: Bool
        let res = DateTime.now(timeZone: TimeZone.UTC).zone
        if (res == TimeZone.UTC) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_04(): Unit {
        var flag: Bool
        let res = DateTime.nowUTC().zone
        if (res == TimeZone.UTC) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_05(): Unit {
        var flag: Bool
        let duration = Duration.nanosecond
        let res = DateTime.fromUnixTimeStamp(duration).zone
        if (res == TimeZone.UTC) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_06(): Unit {
        var flag: Bool
        let res = DateTime.ofEpoch(second: 0, nanosecond: 0).zone
        if (res == TimeZone.UTC) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_07(): Unit {
        var flag: Bool
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .zone
        if (res == TimeZone.UTC) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_08(): Unit {
        var flag: Bool
        let res = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_09(): Unit {
        var flag: Bool
        let res = DateTime.ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .zone
        if (res == TimeZone.UTC) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_zone_10(): Unit {
        var flag: Bool
        let res = DateTime.parse("2023-04-13T00:00:00+08:00").zone
        println(res.toString())
        if (res.toString() == "GMT+8") {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }
}
