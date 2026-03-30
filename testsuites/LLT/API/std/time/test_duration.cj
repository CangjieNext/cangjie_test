/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./test_duration_pub.cj
// EXEC-0: %compiler %cmp_opt %f test_duration_pub.cj -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.time.*

@Test
public class DurationTest {
    @TestCase
    func checkAllProp(): Unit {
        @Expect(Duration.nanosecond.toNanoseconds(), 1)
        @Expect(Duration.microsecond.toNanoseconds(), NS_PER_US)
        @Expect(Duration.millisecond.toNanoseconds(), NS_PER_MS)
        @Expect(Duration.second.toNanoseconds(), NS_PER_SECOND)
        @Expect(Duration.minute.toNanoseconds(), NS_PER_MINUTE)
        @Expect(Duration.hour.toNanoseconds(), NS_PER_HOUR)
        @Expect(Duration.day.toNanoseconds(), NS_PER_DAY)
        @Expect(Duration.Zero.toNanoseconds(), 0)
        var dur_sec = Duration.Max.toSeconds()
        var dur_ns = (Duration.Max - Duration.second * dur_sec).toNanoseconds()
        @Expect(dur_sec, INT64_MAX)
        @Expect(dur_ns, 999999999)
        dur_sec = Duration.Min.toSeconds()
        dur_ns = (Duration.Min - Duration.second * dur_sec).toNanoseconds()
        @Expect(dur_sec, INT64_MIN)
        @Expect(dur_ns, 0)
    }

    @TestCase
    func checkPropException(): Unit {
        var dur = Duration.nanosecond * INT64_MAX + Duration.nanosecond
        try {
            dur.toNanoseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in nanosecond exceeds the range of 'Int64'.")
        }

        dur = dur * 1000
        try {
            dur.toMicroseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in microsecond exceeds the range of 'Int64'.")
        }

        dur = dur * 1000
        try {
            dur.toMilliseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in millisecond exceeds the range of 'Int64'.")
        }
    }

    @TestCase
    func timeUnitConversion(): Unit {
        var baseDuration = getDuration(1, 2, 3, 4, 5, 6, 7)
        let dayDuration = 1
        let hourDuration = dayDuration * HOUR_PER_DAY + 2
        let minuteDuration = hourDuration * MINUTES_PER_HOUR + 3
        let secDuration = minuteDuration * SECS_PER_MINUTE + 4
        let msDuration = secDuration * MS_PER_SECS + 5
        let usDuration = msDuration * US_PER_MS + 6
        let nsDuration = usDuration * NS_PER_US + 7
        @Expect(baseDuration.toDays(), dayDuration)
        @Expect(baseDuration.toHours(), hourDuration)
        @Expect(baseDuration.toMinutes(), minuteDuration)
        @Expect(baseDuration.toSeconds(), secDuration)
        @Expect(baseDuration.toMilliseconds(), msDuration)
        @Expect(baseDuration.toMicroseconds(), usDuration)
        @Expect(baseDuration.toNanoseconds(), nsDuration)
    }

    @TestCase
    func checkHashCode(): Unit {
        let baseDuration = Duration.day * 2
        let hourDuration = Duration.hour * HOUR_PER_DAY * 2
        let minuteDuration = Duration.minute * MINUTES_PER_HOUR * HOUR_PER_DAY * 2
        @Expect(baseDuration.hashCode(), hourDuration.hashCode())
        @Expect(baseDuration.hashCode(), minuteDuration.hashCode())
    }

    @TestCase
    func checkallPropAbs(): Unit {
        @Expect(absDurationToString(Duration.nanosecond), "1ns")
        @Expect(absDurationToString(Duration.microsecond), "1us")
        @Expect(absDurationToString(Duration.millisecond), "1ms")
        @Expect(absDurationToString(Duration.second), "1s")
        @Expect(absDurationToString(Duration.minute), "1m")
        @Expect(absDurationToString(Duration.hour), "1h")
        @Expect(absDurationToString(Duration.day), "1d")
        @Expect(absDurationToString(Duration.Zero), "0s")
        @Expect(absDurationToString(Duration.Max), "106751991167300d15h30m7s999ms999us999ns")
        @Expect(absDurationToString(Duration.nanosecond * (-1)), "1ns")
        @Expect(absDurationToString(Duration.microsecond * (-1)), "1us")
        @Expect(absDurationToString(Duration.millisecond * (-1)), "1ms")
        @Expect(absDurationToString(Duration.second * (-1)), "1s")
        @Expect(absDurationToString(Duration.minute * (-1)), "1m")
        @Expect(absDurationToString(Duration.hour * (-1)), "1h")
        @Expect(absDurationToString(Duration.day * (-1)), "1d")
        @Expect(absDurationToString(Duration.Zero * (-1)), "0s")
        @Expect(absDurationToString(Duration.Max * (-1)), "106751991167300d15h30m7s999ms999us999ns")
        @Expect(absDurationToString(Duration.Min), ARITHMETIC_EXCEPTION_OF_DURATION)
    }

    @TestCase
    func operationAddOverFlow(): Unit {
        @Expect(durationAdd(Duration.Max, Duration.nanosecond), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationAdd(Duration.Max, Duration.second), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationAdd(Duration.Min, Duration.nanosecond * (-1)), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationAdd(Duration.Min, Duration.second * (-1)), ARITHMETIC_EXCEPTION_OF_DURATION)
    }

    @TestCase
    func operationAdd(): Unit {
        @Expect(Duration.nanosecond * 999 + Duration.nanosecond, Duration.microsecond)
        @Expect(Duration.microsecond * 999 + Duration.microsecond, Duration.millisecond)
        @Expect(Duration.millisecond * 999 + Duration.millisecond, Duration.second)
        @Expect(Duration.second * 59 + Duration.second, Duration.minute)
        @Expect(Duration.minute * 59 + Duration.minute, Duration.hour)
        @Expect(Duration.hour * 23 + Duration.hour, Duration.day)
        @Expect(durationAdd(Duration.day, Duration.Zero), "1d")
        @Expect(durationAdd(Duration.Zero, Duration.day), "1d")
        @Expect(durationAdd(getDuration(1, 3, 5, 7, 9, 11, 13), getDuration(2, 4, 6, 8, 10, 12, 14)),
                             getDuration(3, 7, 11, 15, 19, 23, 27).toString())
    }

    @TestCase
    func operationSubstractOverFlow(): Unit {
        @Expect(durationSubstract(Duration.Min, Duration.nanosecond), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationSubstract(Duration.Min, Duration.second), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationSubstract(Duration.Max, (-1) * Duration.nanosecond), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationSubstract(Duration.Max, (-1) * Duration.second), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationSubstract(Duration.Zero, Duration.Min), ARITHMETIC_EXCEPTION_OF_DURATION)
    }

    @TestCase
    func operationSubstract(): Unit {
        @Expect(Duration.nanosecond * (-999) - Duration.nanosecond, (-1) * Duration.microsecond)
        @Expect(Duration.microsecond * (-999) - Duration.microsecond, (-1) * Duration.millisecond)
        @Expect(Duration.millisecond * (-999) - Duration.millisecond, (-1) * Duration.second)
        @Expect(Duration.second * (-59) - Duration.second, (-1) * Duration.minute)
        @Expect(Duration.minute * (-59) - Duration.minute, (-1) * Duration.hour)
        @Expect(Duration.hour * (-23) - Duration.hour, (-1) * Duration.day)
        @Expect(durationSubstract(Duration.day, Duration.Zero), "1d")
        @Expect(durationSubstract(getDuration(1, 3, 5, 7, 9, 11, 13), getDuration(2, 4, 6, 8, 10, 12, 14)),
                                   getDuration(-1, -1, -1, -1, -1, -1, -1).toString())
        @Expect(durationSubstract(getDuration(7, 6, 5, 4, 3, 2, 1), getDuration(1, 2, 3, 4, 5, 6, 7)),
                                   getDuration(6, 4, 2, 0, -2, -4, -6).toString())
    }

    @TestCase
    func operationMultiplyOverFlow(): Unit {
        @Expect(durationMultiplyInt64(Duration.Max, 2), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationMultiplyInt64(Duration.Min, -1), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationMultiplyInt64(Duration.Min, 2), ARITHMETIC_EXCEPTION_OF_DURATION)

        @Expect(int64MultiplyDuration(2, Duration.Max), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(int64MultiplyDuration(-1, Duration.Min), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(int64MultiplyDuration(2, Duration.Min), ARITHMETIC_EXCEPTION_OF_DURATION)

        @Expect(durationMultiplyInt64(Duration.Max / 0xFFFF_FFFF, 0xFFFF_FFFF + 1), ARITHMETIC_EXCEPTION_OF_DURATION)

        @Expect(durationMultiplyFloat64(Duration.nanosecond, Float64.Max), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationMultiplyFloat64(Duration.nanosecond, Float64.Min), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationMultiplyFloat64(Duration.Max, 1.000001), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationMultiplyFloat64(Duration.Min, -1.000001), ARITHMETIC_EXCEPTION_OF_DURATION)

        @Expect(float64MultiplyDuration(Float64.NaN, Duration.nanosecond), "The value of operand cannot be Float64.NaN(not a number)!")
        @Expect(float64MultiplyDuration(Float64.Max, Duration.nanosecond), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(float64MultiplyDuration(Float64.Min, Duration.nanosecond), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(float64MultiplyDuration(1.000001, Duration.Max), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(float64MultiplyDuration(-1.000001, Duration.Min), ARITHMETIC_EXCEPTION_OF_DURATION)
    }

    @TestCase
    func operationMultiply(): Unit {
        @Expect(durationMultiplyInt64(Duration.Max, 0), "0s")
        @Expect(durationMultiplyInt64(Duration.Zero, 100), "0s")
        @Expect(durationMultiplyInt64(Duration.hour, 1), "1h")
        @Expect(durationMultiplyInt64(Duration.nanosecond, 100), "100ns")
        @Expect(durationMultiplyInt64(getDuration(5, 3, 8, 7, 6, 1, 2), 2), getDuration(10, 6, 16, 14, 12, 2, 4).toString())

        @Expect(int64MultiplyDuration(0, Duration.Max), "0s")
        @Expect(int64MultiplyDuration(100, Duration.Zero), "0s")
        @Expect(int64MultiplyDuration(1, Duration.hour), "1h")
        @Expect(int64MultiplyDuration(100, Duration.nanosecond), "100ns")
        @Expect(int64MultiplyDuration(2, getDuration(5, 3, 8, 7, 6, 1, 2)), getDuration(10, 6, 16, 14, 12, 2, 4).toString())

        let dur1 = Duration.second * 123456789 + Duration.nanosecond * 987654321
        let multiplier1 = Int64(10 ** 9)
        @Expect(dur1 * multiplier1, Duration.second * 123456789987654321)
        @Expect(dur1 * (multiplier1 + 1), Duration.second * 123456789987654321 + dur1)
        @Expect(dur1 * (multiplier1 - 1), Duration.second * 123456789987654321 - dur1)

        let dur2 = Duration.second + Duration.nanosecond
        var multiplier2 = 0xFFFF_FFFF
        @Expect(dur2 * multiplier2, Duration.second * (multiplier2 + multiplier2 / multiplier1) + Duration.nanosecond * (multiplier2 % multiplier1))
        multiplier2 = multiplier2 + 1
        @Expect(dur2 * multiplier2, Duration.second * (multiplier2 + multiplier2 / multiplier1) + Duration.nanosecond * (multiplier2 % multiplier1))
        multiplier2 = multiplier2 - 2
        @Expect(dur2 * multiplier2, Duration.second * (multiplier2 + multiplier2 / multiplier1) + Duration.nanosecond * (multiplier2 % multiplier1))

        @Expect(durationMultiplyFloat64(Duration.Max, 0.0f64), "0s")
        @Expect(durationMultiplyFloat64(Duration.Zero, 2.5), "0s")
        @Expect(durationMultiplyFloat64(Duration.hour, 1.0f64), "1h")
        @Expect(durationMultiplyFloat64(getDuration(5, 3, 8, 7, 6, 1, 2), 2.5), getDuration(12, 19, 50, 17, 515, 2, 505).toString())

        @Expect(float64MultiplyDuration(0.0f64, Duration.Max), "0s")
        @Expect(float64MultiplyDuration(2.5, Duration.Zero), "0s")
        @Expect(float64MultiplyDuration(1.0f64, Duration.hour), "1h")
        @Expect(float64MultiplyDuration(2.5, getDuration(5, 3, 8, 7, 6, 1, 2)), getDuration(12, 19, 50, 17, 515, 2, 505).toString())
    }

    @TestCase
    func operationDivideZero(): Unit {
        @Expect(durationDivideInt64(Duration.Max, 0), "The value of right operand cannot be 0!")
        @Expect(durationDivideFloat64(Duration.Max, Float64(0)), "The value of right operand cannot be 0.0!")
        try {
            Duration.Max / Duration.Zero
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The value of right operand cannot be Duration.Zero!")
        }
    }

    @TestCase
    func operationDivideOverFlow(): Unit {
        @Expect(durationDivideInt64(Duration.Min, -1), ARITHMETIC_EXCEPTION_OF_DURATION)
        @Expect(durationDivideFloat64(Duration.Min, Float64.NaN), "The value of right operand cannot be Float64.NaN(not a number)!")
    }

    @TestCase
    func operationDivide(): Unit {
        @Expect(durationDivideInt64(Duration.Zero, 10), "0s")
        @Expect(durationDivideFloat64(Duration.Zero, 2.5), "0s")

        @Expect(durationDivideInt64(Duration.hour, 1), "1h")
        @Expect(durationDivideFloat64(Duration.minute, 1.000), "1m")

        let dur1 = Duration.second * 123456789 + Duration.nanosecond * 987654321
        let multiplier1 = Int64(10 ** 9)
        @Expect(dur1 * multiplier1 / multiplier1, dur1)
        @Expect(dur1 * (multiplier1 + 1) / (multiplier1 + 1), dur1)
        @Expect(dur1 * (multiplier1 - 1) / (multiplier1 - 1), dur1)

        let dur2 = Duration.second + Duration.nanosecond
        var multiplier2 = 0xFFFF_FFFF
        @Expect(dur2 * multiplier2 / multiplier2, dur2)
        multiplier2 = multiplier2 + 1
        @Expect(dur2 * multiplier2 / multiplier2, dur2)
        multiplier2 = multiplier2 - 2
        @Expect(dur2 * multiplier2 / multiplier2, dur2)

        @Expect(durationDivideInt64(getDuration(2, 4, 8, 6, 2, 10, 20), 2), getDuration(1, 2, 4, 3, 1, 5, 10).toString())
        @Expect(durationDivideFloat64(getDuration(2, 4, 8, 6, 2, 10, 20), 1.5), getDuration(1, 10, 45, 24, 1, 340, 13).toString())
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20)/getDuration(1, 2, 4, 3, 1, 5, 10), Float64(2))
    }

    @TestCase
    func mulAndDiv(): Unit {
        let dur = Duration.second + Duration.nanosecond
        var multiplier = 1223372036854775807
        @Expect(dur * multiplier / multiplier, dur)
        multiplier = 8223372036854775807
        @Expect(dur * multiplier / multiplier, dur)
    }

    @TestCase
    func durationComPare(): Unit {
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20).compare(getDuration(1, 2, 4, 3, 1, 5, 10)), Ordering.GT)
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20) > getDuration(1, 2, 4, 3, 1, 5, 10))
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20) >= getDuration(1, 2, 4, 3, 1, 5, 10))
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20) != getDuration(1, 2, 4, 3, 1, 5, 10))

        @Expect(getDuration(1, 2, 4, 3, 1, 5, 10).compare(getDuration(2, 4, 8, 6, 2, 10, 20)), Ordering.LT)
        @Expect(getDuration(1, 2, 4, 3, 1, 5, 10) < getDuration(2, 4, 8, 6, 2, 10, 20))
        @Expect(getDuration(1, 2, 4, 3, 1, 5, 10) <= getDuration(2, 4, 8, 6, 2, 10, 20))
        @Expect(getDuration(1, 2, 4, 3, 1, 5, 10) != getDuration(2, 4, 8, 6, 2, 10, 20))

        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20).compare(getDuration(2, 4, 8, 6, 2, 10, 20)), Ordering.EQ)
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20) == getDuration(2, 4, 8, 6, 2, 10, 20))
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20) >= getDuration(2, 4, 8, 6, 2, 10, 20))
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20) <= getDuration(2, 4, 8, 6, 2, 10, 20))
    }

    @TestCase
    func durationToString(): Unit {
        @Expect(getDuration(2, 4, 8, 6, 2, 10, 20).toString(), "2d4h8m6s2ms10us20ns")
        @Expect(getDuration(-1, -2, -4, -3, -1, -5, -10).toString(), "-1d2h4m3s1ms5us10ns")
        @Expect(getDuration(5, 3, 0, 7, 6, 0, 0).toString(), "5d3h7s6ms")
    }

    @TestCase
    func operationDivideLargeDivisor(): Unit {
        let largeDivisor: Int64 = 0x1_0000_0000
        let dur = Duration.second * 100 + Duration.nanosecond * 500000000
        let result = dur / largeDivisor
        @Expect(result.toNanoseconds(), 23)
        
        let dur3 = Duration.second * 1000
        let divisor3: Int64 = 1000
        let result3 = dur3 / divisor3
        @Expect(result3, Duration.second)
        
        let dur4 = Duration.second * 100000
        let divisor4: Int64 = 0x1_0000_0001
        let result4 = dur4 / divisor4
        @Expect(result4.toNanoseconds() > 0, true)
    }
}
