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
class Test_toString {
    @TestCase
    func test_toString_01(): Unit {
        let duration1 = Duration.nanosecond + Duration.microsecond + Duration.millisecond + Duration.second + Duration
            .minute + Duration.hour + Duration.day
        let duration2 = Duration.Zero
        let duration3 = Duration.nanosecond * 999
        let duration4 = duration1 * -1
        @Assert(duration1.toString(), "1d1h1m1s1ms1us1ns")
        @Assert(duration2.toString(), "0s")
        @Assert(duration3.toString(), "999ns")
        @Assert(duration4.toString(), "-1d1h1m1s1ms1us1ns")
    }

    @TestCase
    func test_toString_02(): Unit {
        let duration1 = Duration.microsecond + Duration.millisecond + Duration.second + Duration.minute + Duration.hour +
            Duration.day
        let duration2 = Duration.nanosecond + Duration.millisecond + Duration.second + Duration.minute + Duration.hour + Duration
            .day
        let duration3 = Duration.nanosecond + Duration.microsecond + Duration.second + Duration.minute + Duration.hour + Duration
            .day
        let duration4 = Duration.nanosecond + Duration.microsecond + Duration.millisecond + Duration.minute + Duration
            .hour + Duration.day
        let duration5 = Duration.nanosecond + Duration.microsecond + Duration.millisecond + Duration.second + Duration
            .hour + Duration.day
        let duration6 = Duration.nanosecond + Duration.microsecond + Duration.millisecond + Duration.second + Duration
            .minute + Duration.day
        let duration7 = Duration.nanosecond + Duration.microsecond + Duration.millisecond + Duration.second + Duration
            .minute + Duration.hour
        @Assert(duration1.toString(), "1d1h1m1s1ms1us")
        @Assert(duration2.toString(), "1d1h1m1s1ms1ns")
        @Assert(duration3.toString(), "1d1h1m1s1us1ns")
        @Assert(duration4.toString(), "1d1h1m1ms1us1ns")
        @Assert(duration5.toString(), "1d1h1s1ms1us1ns")
        @Assert(duration6.toString(), "1d1m1s1ms1us1ns")
        @Assert(duration7.toString(), "1h1m1s1ms1us1ns")
    }

    @TestCase
    func test_toString_03(): Unit {
        let duration1 = Duration.nanosecond + Duration.microsecond
        let duration2 = Duration.nanosecond + Duration.millisecond
        let duration3 = Duration.nanosecond + Duration.second
        let duration4 = Duration.nanosecond + Duration.minute
        let duration5 = Duration.nanosecond + Duration.hour
        let duration6 = Duration.nanosecond + Duration.day

        let duration7 = Duration.microsecond + Duration.millisecond
        let duration8 = Duration.microsecond + Duration.second
        let duration9 = Duration.microsecond + Duration.minute
        let duration10 = Duration.microsecond + Duration.hour
        let duration11 = Duration.microsecond + Duration.day

        let duration12 = Duration.millisecond + Duration.second
        let duration13 = Duration.millisecond + Duration.minute
        let duration14 = Duration.millisecond + Duration.hour
        let duration15 = Duration.millisecond + Duration.day

        let duration16 = Duration.second + Duration.minute
        let duration17 = Duration.second + Duration.hour
        let duration18 = Duration.second + Duration.day

        let duration19 = Duration.minute + Duration.hour
        let duration20 = Duration.minute + Duration.day

        @Assert(duration1.toString(), "1us1ns")
        @Assert(duration2.toString(), "1ms1ns")
        @Assert(duration3.toString(), "1s1ns")
        @Assert(duration4.toString(), "1m1ns")
        @Assert(duration5.toString(), "1h1ns")
        @Assert(duration6.toString(), "1d1ns")
        @Assert(duration7.toString(), "1ms1us")
        @Assert(duration8.toString(), "1s1us")
        @Assert(duration9.toString(), "1m1us")
        @Assert(duration10.toString(), "1h1us")
        @Assert(duration11.toString(), "1d1us")
        @Assert(duration12.toString(), "1s1ms")
        @Assert(duration13.toString(), "1m1ms")
        @Assert(duration14.toString(), "1h1ms")
        @Assert(duration15.toString(), "1d1ms")
        @Assert(duration16.toString(), "1m1s")
        @Assert(duration17.toString(), "1h1s")
        @Assert(duration18.toString(), "1d1s")
        @Assert(duration19.toString(), "1h1m")
        @Assert(duration20.toString(), "1d1m")
    }
}
