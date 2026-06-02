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
class Test_sub {
    @TestCase
    func test_sub_01(): Unit {
        let time1 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let time2 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Assert(res1.toString(), "0s")
        @Assert(res2.toString(), "0s")
    }

    @TestCase
    func test_sub_02(): Unit {
        let time1 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 1, nanosecond: 0)
        let time2 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Assert(res1.toString(), "1s")
        @Assert(res2.toString(), "-1s")
    }

    @TestCase
    func test_sub_03(): Unit {
        let time1 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 1, second: 0, nanosecond: 0)
        let time2 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Assert(res1.toString(), "1m")
        @Assert(res2.toString(), "-1m")
    }

    @TestCase
    func test_sub_04(): Unit {
        let time1 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 1, minute: 0, second: 0, nanosecond: 0)
        let time2 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Assert(res1.toString(), "1h")
        @Assert(res2.toString(), "-1h")
    }

    @TestCase
    func test_sub_05(): Unit {
        let time1 = DateTime.of(year: 0, month: 1, dayOfMonth: 2, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let time2 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Assert(res1.toString(), "1d")
        @Assert(res2.toString(), "-1d")
    }

    @TestCase
    func test_sub_06(): Unit {
        let time1 = DateTime.of(year: 0, month: 2, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let time2 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Assert(res1.toString(), "31d")
        @Assert(res2.toString(), "-31d")
    }

    @TestCase
    func test_sub_07(): Unit {
        let time1 = DateTime.of(year: 1, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let time2 = DateTime.of(year: 0, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Assert(res1.toString(), "366d")
        @Assert(res2.toString(), "-366d")
    }

    @TestCase
    func test_sub_08(): Unit {
        let time1 = DateTime.of(year: 2000, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let time2 = DateTime.of(year: 2024, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res1 = (time1 - time2).toString()
        let res2 = (time2 - time1).toString()
        @Expect(res1, "-8766d")
        @Expect(res2, "8766d")
    }

    @TestCase
    func test_sub_9(): Unit {
        let time = DateTime.now()
        let dur = Duration.second * 123456789 + Duration.nanosecond * 123456789
        let res = time + dur - time
        @Assert(res, dur)
    }
}
