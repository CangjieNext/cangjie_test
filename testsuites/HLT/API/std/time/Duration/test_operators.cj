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
import std.random.*

@Test
class Test_operators {
    @TestCase
    func test_add_01(): Unit {
        var flag = false
        try {
            let duration = Duration.Max + Duration.nanosecond
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_add_02(): Unit {
        let num1 = Int64(Random().nextInt32())
        var num2 = Int64(Random().nextInt32())
        let duration1 = Duration.nanosecond * num1
        let duration2 = Duration.nanosecond * num2
        let add_num = Duration.nanosecond * (num1 + num2)
        let add_duration = duration1 + duration2
        @Assert(add_num, add_duration)
    }

    @TestCase
    func test_add_03(): Unit {
        let duration1 = Duration.Max
        let duration2 = Duration.Min
        let res = duration1 + duration2
        @Assert(res, Duration.nanosecond * -1)
        @Assert(res.toString(), "-1ns")
    }

    @TestCase
    func test_sub_01(): Unit {
        var flag = false
        try {
            let duration = Duration.Min - Duration.nanosecond
        } catch (e: ArithmeticException) {
            flag = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_sub_02(): Unit {
        let num1 = Int64(Random().nextInt32())
        let num2 = Int64(Random().nextInt32())
        let duration1 = Duration.nanosecond * num1
        let duration2 = Duration.nanosecond * num2
        let sub_num = Duration.nanosecond * (num1 - num2)
        let sub_duration = duration1 - duration2
        @Assert(sub_num, sub_duration)
    }

    @TestCase
    func test_mul_01(): Unit {
        let duration = Duration.nanosecond * Random().nextInt64()
        let duration1 = duration * 0
        let duration2 = duration * 1
        let duration3 = Duration.nanosecond * Int64.Max
        let duration4 = Duration.nanosecond * Int64.Min
        @Assert(duration1, Duration.Zero)
        @Assert(duration2, duration)
        @Assert(duration3.toString(), "106751d23h47m16s854ms775us807ns")
        @Assert(duration4.toString(), "-106751d23h47m16s854ms775us808ns")
    }

    @TestCase
    func test_mul_02(): Unit {
        let duration = Duration.nanosecond * Random().nextInt64()
        let duration1 = duration * 0.0
        let duration2 = duration * 1.0
        let duration3 = Duration.nanosecond * 2.0
        let duration4 = Duration.nanosecond * -2.0
        @Assert(duration1, Duration.Zero)
        @Assert(duration2, duration)
        @Assert(duration3.toString(), "2ns")
        @Assert(duration4.toString(), "-2ns")
    }

    @TestCase
    func test_mul_03(): Unit {
        let duration = Random().nextInt64() * Duration.nanosecond
        let duration1 = 0 * duration
        let duration2 = 1 * duration
        let duration3 = Int64.Max * Duration.nanosecond
        let duration4 = Int64.Min * Duration.nanosecond
        @Assert(duration1, Duration.Zero)
        @Assert(duration2, duration)
        @Assert(duration3.toString(), "106751d23h47m16s854ms775us807ns")
        @Assert(duration4.toString(), "-106751d23h47m16s854ms775us808ns")
    }

    @TestCase
    func test_mul_04(): Unit {
        let r = Random().nextInt64()
        let duration = r * Duration.nanosecond
        let duration1 = 0.0 * duration
        let duration2 = 1.0 * duration
        let duration3 = 2.0 * Duration.nanosecond
        let duration4 = -2.0 * Duration.nanosecond
        @Assert(duration1, Duration.Zero)
        @Assert(duration2, duration)
        @Assert(duration3.toString(), "2ns")
        @Assert(duration4.toString(), "-2ns")
    }

    @TestCase
    func test_mul_05(): Unit {
        var flag1 = false
        var flag2 = false
        var flag3 = false
        var flag4 = false

        try {
            let duration = Duration.Max * 2
        } catch (e: ArithmeticException) {
            flag1 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        try {
            let duration = Duration.Min * -2
        } catch (e: ArithmeticException) {
            flag2 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        try {
            let duration = 2 * Duration.Max
        } catch (e: ArithmeticException) {
            flag3 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        try {
            let duration = -2 * Duration.Min
        } catch (e: ArithmeticException) {
            flag4 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        @Assert(flag1, true)
        @Assert(flag2, true)
        @Assert(flag3, true)
        @Assert(flag4, true)
    }

    @TestCase
    func test_mul_06(): Unit {
        var flag1 = false
        var flag2 = false
        var flag3 = false
        var flag4 = false
        var flag5 = false

        try {
            let duration = Duration.Max * 1.1
        } catch (e: ArithmeticException) {
            flag1 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        try {
            let duration = Duration.Min * -1.1
        } catch (e: ArithmeticException) {
            flag2 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        try {
            let duration = 1.1 * Duration.Max
        } catch (e: ArithmeticException) {
            flag3 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        try {
            let duration = -1.1 * Duration.Min
        } catch (e: ArithmeticException) {
            flag4 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        try {
            let duration = Duration.nanosecond * Float64.Inf
        } catch (e: ArithmeticException) {
            flag5 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        @Assert(flag1, true)
        @Assert(flag2, true)
        @Assert(flag3, true)
        @Assert(flag4, true)
        @Assert(flag5, true)
    }

    @TestCase
    func test_mul_07(): Unit {
        var flag1 = false
        var flag2 = false
        var flag3 = false

        try {
            let duration = Duration.nanosecond * Float64.NaN
        } catch (e: IllegalArgumentException) {
            flag1 = true
            @Assert(e.message, "The value of operand cannot be Float64.NaN(not a number)!")
        }

        try {
            let duration = Float64.NaN * Duration.nanosecond
        } catch (e: IllegalArgumentException) {
            flag2 = true
            @Assert(e.message, "The value of operand cannot be Float64.NaN(not a number)!")
        }

        try {
            let duration = Float64.Inf * Duration.nanosecond
        } catch (e: ArithmeticException) {
            flag3 = true
            @Assert(e.message, "Out of range of representation of 'Duration'!")
        }

        @Assert(flag1, true)
        @Assert(flag2, true)
        @Assert(flag3, true)
    }

    @TestCase
    func test_div_01(): Unit {
        var flag = false
        try {
            let duration = Duration.nanosecond / 0
        } catch (e: IllegalArgumentException) {
            flag = true
            @Assert(e.message, "The value of right operand cannot be 0!")
        }

        @Assert(flag, true)
    }

    @TestCase
    func test_div_02(): Unit {
        let duration1 = Duration.microsecond / 1
        let duration2 = Duration.microsecond / 2
        let duration3 = Duration.Zero / 2
        @Assert(duration1, Duration.nanosecond * 1000)
        @Assert(duration2, Duration.nanosecond * 500)
        @Assert(duration3, Duration.Zero)
    }

    @TestCase
    func test_div_03(): Unit {
        var flag = false
        try {
            let duration = Duration.nanosecond / 0.0
        } catch (e: IllegalArgumentException) {
            flag = true
            @Assert(e.message, "The value of right operand cannot be 0.0!")
        }

        @Assert(flag, true)
    }

    @TestCase
    func test_div_04(): Unit {
        let duration1 = Duration.microsecond / 1.0
        let duration2 = Duration.microsecond / 2.0
        let duration3 = Duration.microsecond / Float64.Inf
        let duration4 = Duration.Zero / 3.0
        @Assert(duration1, Duration.nanosecond * 1000)
        @Assert(duration2, Duration.nanosecond * 500)
        @Assert(duration3, Duration.Zero)
        @Assert(duration4, Duration.Zero)
    }

    @TestCase
    func test_div_05(): Unit {
        var flag = false

        try {
            let duration = Duration.nanosecond / Float64.NaN
        } catch (e: IllegalArgumentException) {
            flag = true
            @Assert(e.message, "The value of right operand cannot be Float64.NaN(not a number)!")
        }

        @Assert(flag, true)
    }

    @TestCase
    func test_div_06(): Unit {
        let duration1 = Duration.Zero / Duration.nanosecond
        let duration2 = Duration.microsecond / Duration.nanosecond
        let duration3 = (Duration.nanosecond * -1) / Duration.microsecond
        @Assert(duration1, 0.0)
        @Assert(duration2, 1000.0)
        @Assert(duration3, -0.001)
    }

    @TestCase
    func test_div_07(): Unit {
        var flag = false
        try {
            let duration = Duration.nanosecond / Duration.Zero
        } catch (e: IllegalArgumentException) {
            flag = true
            @Assert(e.message, "The value of right operand cannot be Duration.Zero!")
        }
        @Assert(flag, true)
    }
}
