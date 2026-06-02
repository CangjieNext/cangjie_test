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
import std.random.*

@Test
class Test_ofEpoch {
    @TestCase
    func test_ofEpoch_01(): Unit {
        let res = DateTime.ofEpoch(second: 0, nanosecond: 0)
        @Assert(res, DateTime.UnixEpoch)
    }

    @TestCase
    func test_ofEpoch_02(): Unit {
        var flag = false
        try {
            let res = DateTime.ofEpoch(second: Int64.Max, nanosecond: 0)
        } catch (e: ArithmeticException) {
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_ofEpoch_03(): Unit {
        var flag = false
        try {
            let res = DateTime.ofEpoch(second: Int64.Min, nanosecond: 0)
        } catch (e: ArithmeticException) {
            @Assert(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_ofEpoch_04(): Unit {
        let res = DateTime.ofEpoch(second: 60, nanosecond: 0)
        let sub = res - DateTime.UnixEpoch
        @Assert(res.toString(), "1970-01-01T00:01:00Z")
        @Assert(sub.toString(), "1m")
    }

    @TestCase
    func test_ofEpoch_05(): Unit {
        let res = DateTime.ofEpoch(second: -60, nanosecond: 0)
        let sub = res - DateTime.UnixEpoch
        @Assert(res.toString(), "1969-12-31T23:59:00Z")
        @Assert(sub.toString(), "-1m")
    }

    @TestCase
    func test_ofEpoch_06(): Unit {
        var flag = false
        try {
            let res = DateTime.ofEpoch(second: 0, nanosecond: -1)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "The nanosecond value should be in the range [0, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_ofEpoch_07(): Unit {
        var flag = false
        try {
            let res = DateTime.ofEpoch(second: 0, nanosecond: 1000000000)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "The nanosecond value should be in the range [0, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_ofEpoch_08(): Unit {
        let res = DateTime.ofEpoch(second: 0, nanosecond: 1)
        let sub = res - DateTime.UnixEpoch
        @Assert(res.toString(), "1970-01-01T00:00:00.000000001Z")
        @Assert(sub.toString(), "1ns")
    }

    @TestCase
    func test_ofEpoch_09(): Unit {
        let res = DateTime.ofEpoch(second: 0, nanosecond: 999999999)
        let sub = res - DateTime.UnixEpoch
        @Assert(res.toString(), "1970-01-01T00:00:00.999999999Z")
        @Assert(sub.toString(), "999ms999us999ns")
    }
}
