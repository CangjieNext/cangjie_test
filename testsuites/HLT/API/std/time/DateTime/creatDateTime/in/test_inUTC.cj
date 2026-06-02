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
class Test_inUTC {
    @TestCase
    func test_inUTC_01(): Unit {
        let res = DateTime.UnixEpoch.inUTC().zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_02(): Unit {
        let res = DateTime.now().inUTC().zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_03(): Unit {
        let res = DateTime.now(timeZone: TimeZone.UTC).inUTC().zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_04(): Unit {
        let res = DateTime.nowUTC().inUTC().zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_05(): Unit {
        let duration = Duration.nanosecond
        let res = DateTime.fromUnixTimeStamp(duration).inUTC().zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_06(): Unit {
        let res = DateTime.ofEpoch(second: 0, nanosecond: 0).inUTC().zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_07(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
                timeZone: TimeZone.UTC)
            .inUTC()
            .zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_08(): Unit {
        let res = DateTime
            .of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .inUTC()
            .zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_09(): Unit {
        let res = DateTime
            .ofUTC(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .inUTC()
            .zone
        @Assert(res, TimeZone.UTC)
    }

    @TestCase
    func test_inUTC_10(): Unit {
        let res = DateTime.parse("2023-04-13T00:00:00+08:00").inUTC().zone
        @Assert(res, TimeZone.UTC)
    }
}
