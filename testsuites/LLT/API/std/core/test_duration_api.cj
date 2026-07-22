/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.core.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class DurationApiTest {

    @TestCase
    func test_constants(): Unit {
        @Expect(Duration.Zero.toSeconds(), 0)
        @Expect(Duration.second.toSeconds(), 1)
        @Expect(Duration.millisecond.toMilliseconds(), 1)
        @Expect(Duration.microsecond.toMicroseconds(), 1)
        @Expect(Duration.nanosecond.toNanoseconds(), 1)
        @Expect(Duration.minute.toSeconds(), 60)
        @Expect(Duration.hour.toSeconds(), 3600)
        @Expect(Duration.day.toSeconds(), 86400)
    }

    @TestCase
    func test_to_units(): Unit {
        let d = Duration.second * 3661
        @Expect(d.toSeconds(), 3661)
        @Expect(d.toMinutes(), 61)
        @Expect(d.toHours(), 1)
        @Expect(d.toDays(), 0)

        let ns1 = Duration.nanosecond * 5
        @Expect(ns1.toNanoseconds(), 5)

        let us1 = Duration.microsecond * 3
        @Expect(us1.toMicroseconds(), 3)
        @Expect(us1.toNanoseconds(), 3000)

        let ms1 = Duration.millisecond * 2
        @Expect(ms1.toMilliseconds(), 2)
        @Expect(ms1.toMicroseconds(), 2000)
    }

    @TestCase
    func test_addition(): Unit {
        let a = Duration.second * 2
        let b = Duration.second * 3
        let c = a + b
        @Expect(c.toSeconds(), 5)
    }

    @TestCase
    func test_addition_with_zero(): Unit {
        let a = Duration.second * 5
        let c = a + Duration.Zero
        @Expect(c.toSeconds(), 5)
        let d = Duration.Zero + a
        @Expect(d.toSeconds(), 5)
    }

    @TestCase
    func test_subtraction(): Unit {
        let a = Duration.second * 5
        let b = Duration.second * 2
        let c = a - b
        @Expect(c.toSeconds(), 3)
    }

    @TestCase
    func test_subtraction_with_zero(): Unit {
        let a = Duration.second * 5
        let c = a - Duration.Zero
        @Expect(c.toSeconds(), 5)
        let d = Duration.Zero - a
        @Expect(d.toSeconds(), -5)
    }

    @TestCase
    func test_neg_via_subtraction(): Unit {
        let neg = Duration.Zero - Duration.second
        @Expect(neg.toSeconds(), -1)
    }

    @TestCase
    func test_multiply_int64(): Unit {
        let a = Duration.second * 3
        let b = a * 2
        @Expect(b.toSeconds(), 6)
    }

    @TestCase
    func test_multiply_int64_zero(): Unit {
        let a = Duration.second * 5
        let b = a * 0
        @Expect(b == Duration.Zero, true)
    }

    @TestCase
    func test_multiply_int64_one(): Unit {
        let a = Duration.second * 5
        let b = a * 1
        @Expect(b.toSeconds(), 5)
    }

    @TestCase
    func test_multiply_int64_neg_one(): Unit {
        let a = Duration.second * 5
        let b = a * (-1)
        @Expect(b.toSeconds(), -5)
    }

    @TestCase
    func test_multiply_float64(): Unit {
        let a = Duration.second * 4
        let b = a * 2.5
        @Expect(b.toSeconds(), 10)
    }

    @TestCase
    func test_multiply_float64_zero(): Unit {
        let a = Duration.second * 5
        let b = a * 0.0
        @Expect(b == Duration.Zero, true)
    }

    @TestCase
    func test_multiply_float64_one(): Unit {
        let a = Duration.second * 5
        let b = a * 1.0
        @Expect(b.toSeconds(), 5)
    }

    @TestCase
    func test_multiply_float64_nan(): Unit {
        try {
            let a = Duration.second * 5
            let _ = a * Float64.NaN
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_divide_int64(): Unit {
        let a = Duration.second * 10
        let b = a / 2
        @Expect(b.toSeconds(), 5)
    }

    @TestCase
    func test_divide_int64_one(): Unit {
        let a = Duration.second * 7
        let b = a / 1
        @Expect(b.toSeconds(), 7)
    }

    @TestCase
    func test_divide_int64_zero(): Unit {
        try {
            let a = Duration.second * 5
            let _ = a / 0
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_divide_float64(): Unit {
        let a = Duration.second * 10
        let b = a / 2.0
        @Expect(b.toSeconds(), 5)
    }

    @TestCase
    func test_divide_float64_zero(): Unit {
        try {
            let a = Duration.second * 5
            let _ = a / 0.0
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_divide_duration(): Unit {
        let a = Duration.second * 10
        let b = Duration.second * 2
        let ratio = a / b
        @Expect(ratio, 5.0)
    }

    @TestCase
    func test_divide_duration_by_zero(): Unit {
        try {
            let a = Duration.second * 5
            let _ = a / Duration.Zero
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_comparison(): Unit {
        let a = Duration.second * 5
        let b = Duration.second * 3
        @Assert(a > b)
        @Assert(b < a)
        @Assert(a >= a)
        @Assert(a <= a)
        @Assert(a != b)
        @Assert(!(a == b))
    }

    @TestCase
    func test_compare(): Unit {
        let a = Duration.second * 5
        let b = Duration.second * 3
        @Expect(a.compare(b), Ordering.GT)
        @Expect(b.compare(a), Ordering.LT)
        @Expect(a.compare(a), Ordering.EQ)
    }

    @TestCase
    func test_abs_positive(): Unit {
        let a = Duration.second * 5
        let r = a.abs()
        @Expect(r.toSeconds(), 5)
    }

    @TestCase
    func test_abs_negative(): Unit {
        let a = Duration.Zero - Duration.second * 5
        let r = a.abs()
        @Expect(r.toSeconds(), 5)
    }

    @TestCase
    func test_abs_zero(): Unit {
        let r = Duration.Zero.abs()
        @Expect(r == Duration.Zero, true)
    }

    @TestCase
    func test_tostring_zero(): Unit {
        let s = Duration.Zero.toString()
        @Expect(s, "0s")
    }

    @TestCase
    func test_tostring_second(): Unit {
        let s = Duration.second.toString()
        @Expect(s, "1s")
    }

    @TestCase
    func test_tostring_minute(): Unit {
        let s = Duration.minute.toString()
        @Expect(s, "1m")
    }

    @TestCase
    func test_tostring_hour(): Unit {
        let s = Duration.hour.toString()
        @Expect(s, "1h")
    }

    @TestCase
    func test_tostring_day(): Unit {
        let s = Duration.day.toString()
        @Expect(s, "1d")
    }

    @TestCase
    func test_tostring_negative(): Unit {
        let neg = Duration.Zero - Duration.second
        let s = neg.toString()
        @Assert(s.startsWith("-"))
    }

    @TestCase
    func test_hashcode(): Unit {
        let a = Duration.second * 5
        let b = Duration.second * 5
        @Expect(a.hashCode(), b.hashCode())
    }

    @TestCase
    func test_max_min(): Unit {
        @Assert(Duration.Max > Duration.Zero)
        @Assert(Duration.Min < Duration.Zero)
        @Assert(Duration.Max > Duration.Min)
    }

    @TestCase
    func test_tostring_max(): Unit {
        let s = Duration.Max.toString()
        @Assert(s.size > 0)
    }

    @TestCase
    func test_tostring_min(): Unit {
        let s = Duration.Min.toString()
        @Assert(s.size > 0)
    }

    @TestCase
    func test_abs_min_throws(): Unit {
        try {
            let _ = Duration.Min.abs()
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_multiply_max_throws(): Unit {
        try {
            let _ = Duration.Max * 2
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_multiply_min_throws(): Unit {
        try {
            let _ = Duration.Min * 2
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_int64_times_duration(): Unit {
        let d: Duration = 3 * Duration.second
        @Expect(d.toSeconds(), 3)
    }

    @TestCase
    func test_float64_times_duration(): Unit {
        let d: Duration = 2.5 * Duration.second
        @Expect(d.toSeconds(), 2)
    }

    @TestCase
    func test_overflow_toNanoseconds(): Unit {
        try {
            let _ = Duration.Max.toNanoseconds()
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_overflow_toMicroseconds(): Unit {
        try {
            let _ = Duration.Max.toMicroseconds()
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_overflow_toMilliseconds(): Unit {
        try {
            let _ = Duration.Max.toMilliseconds()
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_divide_min_by_neg1(): Unit {
        try {
            let _ = Duration.Min / (-1)
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_int64_multiply_float64_duration(): Unit {
        let d1 = Duration.second * 10
        let d2 = d1 / 3.0
        @Assert(d2.toSeconds() >= 3)
    }
}
