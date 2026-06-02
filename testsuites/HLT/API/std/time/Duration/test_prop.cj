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

let MAX_INT64: Int64 = 0x7FFF_FFFF_FFFF_FFFF
let MIN_INT64: Int64 = -MAX_INT64 - 1

@Test
class Test_duration_prop {
    @TestCase
    func test_duration_01(): Unit {
        let res = Duration.nanosecond
        let str = res.toString()
        @Assert(res, Duration.nanosecond)
        @Assert(str, "1ns")
    }

    @TestCase
    func test_duration_02(): Unit {
        let res = Duration.microsecond
        let str = res.toString()
        @Assert(res, Duration.nanosecond * 1000)
        @Assert(str, "1us")
    }

    @TestCase
    func test_duration_03(): Unit {
        let res = Duration.millisecond
        let str = res.toString()
        @Assert(res, Duration.nanosecond * 1000 * 1000)
        @Assert(str, "1ms")
    }

    @TestCase
    func test_duration_04(): Unit {
        let res = Duration.second
        let str = res.toString()
        @Assert(res, Duration.nanosecond * 1000 * 1000 * 1000)
        @Assert(str, "1s")
    }

    @TestCase
    func test_duration_05(): Unit {
        let res = Duration.minute
        let str = res.toString()
        @Assert(res, Duration.nanosecond * 1000 * 1000 * 1000 * 60)
        @Assert(str, "1m")
    }

    @TestCase
    func test_duration_06(): Unit {
        let res = Duration.hour
        let str = res.toString()
        @Assert(res, Duration.nanosecond * 1000 * 1000 * 1000 * 60 * 60)
        @Assert(str, "1h")
    }

    @TestCase
    func test_duration_07(): Unit {
        let res = Duration.day
        let str = res.toString()
        @Assert(res, Duration.nanosecond * 1000 * 1000 * 1000 * 60 * 60 * 24)
        @Assert(str, "1d")
    }

    @TestCase
    func test_duration_08(): Unit {
        let res = Duration.Zero
        let str = res.toString()
        @Assert(res, Duration.nanosecond * 0)
        @Assert(str, "0s")
    }

    @TestCase
    func test_duration_09(): Unit {
        let res = Duration.Max
        let str = res.toString()
        @Assert(res, Duration.second * MAX_INT64 + Duration.nanosecond * 999999999)
        @Assert(str, "106751991167300d15h30m7s999ms999us999ns")
    }

    @TestCase
    func test_duration_10(): Unit {
        let res = Duration.Min
        let str = res.toString()
        @Assert(res, Duration.second * MIN_INT64)
        @Assert(str, "-106751991167300d15h30m8s")
    }
}
