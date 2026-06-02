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
class Test_inLocal {
    @TestCase
    func test_inLocal_01(): Unit {
        var flag: Bool
        let res = DateTime.UnixEpoch.inLocal().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_02(): Unit {
        var flag: Bool
        let res = DateTime.now().inLocal().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_03(): Unit {
        var flag: Bool
        let res = DateTime.now(timeZone: TimeZone.Local).inLocal().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_04(): Unit {
        var flag: Bool
        let res = DateTime.nowUTC().inLocal().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_05(): Unit {
        var flag: Bool
        let duration = Duration.nanosecond
        let res = DateTime.fromUnixTimeStamp(duration).inLocal().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_06(): Unit {
        var flag: Bool
        let res = DateTime.ofEpoch(second: 0, nanosecond: 0).inLocal().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_07(): Unit {
        var flag: Bool
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.Local)
            .inLocal()
            .zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_08(): Unit {
        var flag: Bool
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .inLocal()
            .zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_09(): Unit {
        var flag: Bool
        let res = DateTime
            .ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .inLocal()
            .zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_inLocal_10(): Unit {
        var flag: Bool
        let res = DateTime.parse("2023-04-13T00:00:00+08:00").inLocal().zone
        if (res == TimeZone.Local) {
            flag = true
        } else {
            flag = false
        }
        @Assert(flag, true)
    }
}
