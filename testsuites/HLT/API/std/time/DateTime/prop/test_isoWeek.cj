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
class Test_isoWeek {
    @TestCase
    func test_isoWeek_01(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59, nanosecond: 999999999,
                timeZone: TimeZone.UTC)
            .isoWeek
        @Expect(res[0], 999999999)
        @Expect(res[1], 52)
    }

    @TestCase
    func test_isoWeek_02(): Unit {
        let res = DateTime
            .of(year: -999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .isoWeek
        @Expect(res[0], -999999999)
        @Expect(res[1], 1)
    }

    @TestCase
    func test_isoWeek_03(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 23, minute: 59, second: 59, nanosecond: 999999999,
                timeZone: TimeZone.UTC)
            .isoWeek
        @Expect(res[0], 999999998)
        @Expect(res[1], 53)
    }

    @TestCase
    func test_isoWeek_04(): Unit {
        let res = DateTime
            .of(year: -999999999, month: 12, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .isoWeek
        @Expect(res[0], -999999998)
        @Expect(res[1], 1)
    }

    @TestCase
    func test_isoWeek_05(): Unit {
        let res = DateTime.UnixEpoch.isoWeek
        @Expect(res[0], 1970)
        @Expect(res[1], 1)
    }
}
