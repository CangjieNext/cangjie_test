/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt -Woff unused
// EXEC: %run %run_opt %output %run_utest_opt

/*
 * Incremental coverage for std.core duration.cj:
 * Min/Max toString, negation and multiply edge cases, Float64 NaN/overflow,
 * abs/divide exceptions, compare and hashCode.
 */
@Test
class DurationCoverageTest {
    @TestCase
    func testMinMaxToString(): Unit {
        @Expect(Duration.Zero.toString(), "0s")
        @Expect(Duration.Min.toString(), "-106751991167300d15h30m8s")
        @Expect(Duration.Max.toString(), "106751991167300d15h30m7s999ms999us999ns")
    }

    @TestCase
    func testNegativeDurationFormatting(): Unit {
        let neg = Duration.Zero - Duration.second - Duration.millisecond
        @Expect(neg.toString().startsWith("-"), true)
        @Expect((Duration.second - Duration.millisecond * 500).toString().contains("500ms"), true)
    }

    @TestCase
    func testUnaryNegationAndMultiplyMinusOne(): Unit {
        let neg = Duration.Zero - Duration.second
        @Expect(neg.toNanoseconds() < 0, true)
        @Expect(neg * (-1), Duration.second)
        @Expect(Duration.Zero * (-1), Duration.Zero)
    }

    @TestCase
    func testMultiplyAndDivideEdgeCases(): Unit {
        @Expect(Duration.second * 2, Duration.second + Duration.second)
        @Expect(Duration.second * 1, Duration.second)
        @Expect(Duration.second / 2, Duration.millisecond * 500)
        @Expect(Duration.second / Duration.millisecond, 1000.0)
        @Expect(Duration.Zero / Duration.second, 0.0)
    }

    @TestCase
    func testCompareAndHash(): Unit {
        @Expect(Duration.second.compare(Duration.millisecond), Ordering.GT)
        @Expect(Duration.millisecond < Duration.second, true)
        @Expect(Duration.second <= Duration.second, true)
        @Expect(Duration.second >= Duration.millisecond, true)
        @Expect(Duration.second.hashCode() == Duration.second.hashCode(), true)
        @Expect(Duration.second.hashCode() != Duration.millisecond.hashCode(), true)
    }

    @TestCase
    func testAbsPositiveAndNegative(): Unit {
        @Expect(Duration.second.abs(), Duration.second)
        @Expect((Duration.Zero - Duration.second).abs(), Duration.second)
    }

    @TestCase
    func testArithmeticExceptions(): Unit {
        @ExpectThrows[ArithmeticException](Duration.Min.abs())
        @ExpectThrows[ArithmeticException](Duration.Min * 2)
        @ExpectThrows[ArithmeticException](Duration.Max * 2)
        @ExpectThrows[ArithmeticException](Duration.Min / -1)
        @ExpectThrows[ArithmeticException](Duration.Max + Duration.nanosecond)
        @ExpectThrows[ArithmeticException](Duration.Min - Duration.nanosecond)
    }

    @TestCase
    func testIllegalArgumentExceptions(): Unit {
        @ExpectThrows[IllegalArgumentException](Duration.second / 0)
        @ExpectThrows[IllegalArgumentException](Duration.second / 0.0)
        @ExpectThrows[IllegalArgumentException](Duration.second / Duration.Zero)
        @ExpectThrows[IllegalArgumentException](Duration.second * Float64.NaN)
        @ExpectThrows[IllegalArgumentException](Duration.second / Float64.NaN)
    }

    @TestCase
    func testFloat64MultiplyAndDivide(): Unit {
        @Expect(Duration.second * 0.5, Duration.millisecond * 500)
        @Expect(Duration.second / 2.0, Duration.millisecond * 500)
        @Expect(Duration.second * 1.0, Duration.second)
        @Expect(Duration.Zero * 3.5, Duration.Zero)
    }

    @TestCase
    func testConversionHelpers(): Unit {
        @Expect(Duration.second.toSeconds(), 1)
        @Expect(Duration.second.toMilliseconds(), 1000)
        @Expect(Duration.second.toMicroseconds(), 1000000)
        @Expect(Duration.second.toNanoseconds(), 1000000000)
        @Expect(Duration.minute.toMinutes(), 1)
        @Expect(Duration.hour.toHours(), 1)
        @Expect(Duration.day.toDays(), 1)
    }

    @TestCase
    func testCompareSameSecondDifferentNanos(): Unit {
        let a = Duration.second + Duration.nanosecond * 100
        let b = Duration.second + Duration.nanosecond * 200
        @Expect(a < b, true)
        @Expect(a <= b, true)
        @Expect(a > b, false)
        @Expect(a >= b, false)
        @Expect(a == b, false)
        @Expect(a != b, true)
        @Expect(a.compare(b), Ordering.LT)
        @Expect(b.compare(a), Ordering.GT)
        @Expect(a.compare(a), Ordering.EQ)
    }

    @TestCase
    func testCompareDifferentSeconds(): Unit {
        let later = Duration.second * 2
        let earlier = Duration.second + Duration.nanosecond * 999999999
        @Expect(later > earlier, true)
        @Expect(later >= earlier, true)
        @Expect(earlier < later, true)
        @Expect(earlier <= later, true)
    }

    @TestCase
    func testNegativeDurationArithmeticBranches(): Unit {
        let neg = Duration.Zero - Duration.second
        @Expect(neg / 2, Duration.millisecond * -500)
        @Expect(neg / (-2), Duration.millisecond * 500)
        @Expect(neg * (-1), Duration.second)
        @Expect(Duration.Zero - Duration.millisecond, Duration.millisecond * -1)
    }

    @TestCase
    func testLargeDivisorAndFloat64OverflowBranches(): Unit {
        let d = Duration.day
        let small = d / 0x1_0000_0000_i64
        @Expect(small.toNanoseconds() >= 0, true)
        @ExpectThrows[ArithmeticException](Duration.Max * 2.0)
        @ExpectThrows[ArithmeticException](Duration.second * 1.0e20)
    }

    @TestCase
    func testZeroAndIdentityArithmeticBranches(): Unit {
        @Expect(Duration.Zero + Duration.Zero, Duration.Zero)
        @Expect(Duration.Zero - Duration.Zero, Duration.Zero)
        @Expect(Duration.Zero * 99, Duration.Zero)
        @Expect(Duration.second + Duration.Zero, Duration.second)
        @Expect(Duration.second - Duration.Zero, Duration.second)
        @Expect(Duration.second * 0, Duration.Zero)
        @Expect(Duration.second / 1, Duration.second)
        @Expect(Duration.second == Duration.second, true)
        @Expect(Duration.second != Duration.millisecond, true)
    }

    @TestCase
    func testSubtractAndMultiplyOverflowBranches(): Unit {
        @ExpectThrows[ArithmeticException](Duration.Min - Duration.second)
        @ExpectThrows[ArithmeticException](Duration.Max + Duration.second)
        @Expect(Duration.millisecond * 1000, Duration.second)
        @Expect(Duration.second * 2, Duration.second + Duration.second)
    }

    @TestCase
    func testCompareSecLessWithNanosBranches(): Unit {
        let lowSec = Duration.second
        let highNs = Duration.second + Duration.nanosecond * 500
        @Expect(lowSec < highNs, true)
        @Expect(lowSec <= highNs, true)
        @Expect(highNs > lowSec, true)
        @Expect(highNs >= lowSec, true)
        @Expect(lowSec.compare(highNs), Ordering.LT)
    }

    @TestCase
    func testCompareNegativeVsPositiveBranches(): Unit {
        let neg = Duration.Zero - Duration.second
        let pos = Duration.second
        @Expect(neg < pos, true)
        @Expect(neg <= pos, true)
        @Expect(pos > neg, true)
        @Expect(pos >= neg, true)
        @Expect(neg.compare(pos), Ordering.LT)
        @Expect(pos.compare(neg), Ordering.GT)
        @Expect(neg == neg, true)
        @Expect(neg != pos, true)
    }

    @TestCase
    func testCompareEqualSecondsDifferentNanosOrdering(): Unit {
        let a = Duration.second + Duration.nanosecond * 100
        let b = Duration.second + Duration.nanosecond * 200
        @Expect(a.compare(b), Ordering.LT)
        @Expect(b.compare(a), Ordering.GT)
        @Expect(a >= a, true)
        @Expect(b <= b, true)
    }

    @TestCase
    func testMultiplyDivideNegativeDurationBranches(): Unit {
        let negHalf = (Duration.Zero - Duration.second) / 2
        @Expect(negHalf.toNanoseconds() < 0, true)
        @Expect(negHalf * (-2), Duration.second)
        @Expect(Duration.second * (-2), Duration.Zero - Duration.second - Duration.second)
        @Expect(Duration.second / 4.0, Duration.millisecond * 250)
    }

    @TestCase
    func testFromTimeUnitConstants(): Unit {
        @Expect(Duration.nanosecond.toNanoseconds(), 1)
        @Expect(Duration.microsecond.toMicroseconds(), 1)
        @Expect(Duration.millisecond.toMilliseconds(), 1)
        @Expect(Duration.minute.toMinutes(), 1)
        @Expect(Duration.hour.toHours(), 1)
        @Expect(Duration.day.toDays(), 1)
    }

    @TestCase
    func testToStringAllUnitBranches(): Unit {
        let mixed = Duration.day + Duration.hour + Duration.minute + Duration.second +
            Duration.millisecond + Duration.microsecond + Duration.nanosecond
        @Expect(mixed.toString().contains("d"), true)
        @Expect(mixed.toString().contains("h"), true)
        @Expect(mixed.toString().contains("ms"), true)
        let negMixed = Duration.Zero - mixed
        @Expect(negMixed.toString().startsWith("-"), true)
    }

    @TestCase
    func testMultiplyNegativeMultiplierBranches(): Unit {
        let triple = Duration.second * (-3)
        @Expect(triple.toNanoseconds() < 0, true)
        @Expect(Duration.second * (-1), Duration.Zero - Duration.second)
        @Expect(Duration.millisecond * 1000, Duration.second)
        @Expect(Duration.second + Duration.Zero, Duration.second)
        @Expect(Duration.second - Duration.Zero, Duration.second)
    }

    @TestCase
    func testCompareOperatorMatrixExhaustive(): Unit {
        let z = Duration.Zero
        let a = Duration.second
        let b = Duration.second + Duration.nanosecond
        @Expect(z >= z, true)
        @Expect(z <= z, true)
        @Expect(a >= b, false)
        @Expect(a <= b, true)
        @Expect(a.compare(b), Ordering.LT)
        @Expect(b.compare(a), Ordering.GT)
    }

    @TestCase
    func testAbsAndToSameSignNegativeSecPositiveNs(): Unit {
        let d = Duration.Zero - Duration.second + Duration.nanosecond * 500
        @Expect(d.toNanoseconds() < 0, true)
        @Expect(d.abs().toNanoseconds() > 0, true)
    }

    @TestCase
    func testFloat64MultiplyFractionAndLarge(): Unit {
        @Expect(Duration.second * 0.25, Duration.millisecond * 250)
        @Expect(Duration.second / 0.5, Duration.second * 2)
        @Expect(Duration.nanosecond * 1.5, Duration.nanosecond + Duration.nanosecond / 2)
    }

    @TestCase
    func testDurationDivideByDurationAndFloat64(): Unit {
        @Expect(Duration.second / Duration.millisecond, 1000.0)
        @Expect(Duration.Zero / Duration.second, 0.0)
        @Expect(Duration.second / 4.0, Duration.millisecond * 250)
        @Expect((Duration.Zero - Duration.second) / 2.0, Duration.millisecond * -500)
    }

    @TestCase
    func testFloat64DivideZeroAndOne(): Unit {
        @Expect(Duration.second / 1.0, Duration.second)
        @Expect(Duration.Zero / 2.0, Duration.Zero)
        @ExpectThrows[IllegalArgumentException](Duration.second / 0.0)
    }

    @TestCase
    func testNegativeDurationToStringPartialUnits(): Unit {
        let d = Duration.Zero - Duration.hour - Duration.second
        @Expect(d.toString().contains("h"), true)
        @Expect(d.toString().startsWith("-"), true)
    }

    @TestCase
    func testLargeUnitMultiplyAndDurationRatio(): Unit {
        @Expect(Duration.minute * 60, Duration.hour)
        @Expect(Duration.hour / 60, Duration.minute)
        @Expect(Duration.day / Duration.hour, 24.0)
        @Expect(Duration.second + Duration.second, Duration.second * 2)
    }

    @TestCase
    func testCompareZeroAgainstMixedSign(): Unit {
        @Expect(Duration.Zero.compare(Duration.second), Ordering.LT)
        @Expect(Duration.Zero.compare(Duration.Zero - Duration.second), Ordering.GT)
        @Expect(Duration.Zero == Duration.Zero, true)
    }

    @TestCase
    func testDurationDivideByDurationNegativeAndMixed(): Unit {
        let neg = Duration.Zero - Duration.second
        let pos = Duration.second
        @Expect(neg / pos, -1.0)
        @Expect(pos / neg, -1.0)
        @Expect(neg / Duration.millisecond, -1000.0)
    }

    @TestCase
    func testFloat64AtMinMaxBoundaries(): Unit {
        @Expect(Duration.Max * 1.0, Duration.Max)
        @Expect(Duration.Zero * 0.0, Duration.Zero)
        @Expect(Duration.Min * 1.0, Duration.Min)
    }

    @TestCase
    func testAddSubtractMixedSignBranches(): Unit {
        let a = Duration.second + Duration.millisecond * 500
        let b = Duration.millisecond * 200
        @Expect(a - b, Duration.millisecond * 1300)
        @Expect(b - a, Duration.millisecond * -1300)
        @Expect(a + (Duration.Zero - b), Duration.millisecond * 1300)
    }

    @TestCase
    func testToStringSingleUnitBranches(): Unit {
        @Expect(Duration.hour.toString().contains("h"), true)
        @Expect(Duration.minute.toString().contains("m"), true)
        @Expect((Duration.Zero - Duration.microsecond).toString().startsWith("-"), true)
    }

    @TestCase
    func testUnitConversionsOnCompositeDuration(): Unit {
        let d = Duration.day + Duration.hour * 2 + Duration.minute * 3
        @Expect(d.toDays(), 1)
        @Expect(d.toHours(), 26)
        @Expect(d.toMinutes(), 26 * 60 + 3)
        @Expect(d.toSeconds() > 0, true)
        @Expect(d.toNanoseconds() > 0, true)
    }

    @TestCase
    func testInequalityAndOrderingOnNegative(): Unit {
        let neg = Duration.Zero - Duration.second
        let pos = Duration.second
        @Expect(neg != pos, true)
        @Expect(neg < pos, true)
        @Expect(neg <= pos, true)
        @Expect(pos > neg, true)
        @Expect(pos >= neg, true)
    }

    @TestCase
    func testInt64MultiplyZeroAndScaleUp(): Unit {
        @Expect(Duration.second * 0, Duration.Zero)
        @Expect(Duration.millisecond * 1000, Duration.second)
        @Expect(Duration.microsecond * 1000, Duration.millisecond)
    }

    @TestCase
    func testConversionOverflowOnMaxDuration(): Unit {
        @ExpectThrows[ArithmeticException](Duration.Max.toNanoseconds())
        @ExpectThrows[ArithmeticException](Duration.Max.toMicroseconds())
        @ExpectThrows[ArithmeticException](Duration.Max.toMilliseconds())
    }

    @TestCase
    func testToStringSubSecondUnitsOnly(): Unit {
        let d = Duration.millisecond * 5 + Duration.microsecond * 6 + Duration.nanosecond * 7
        @Expect(d.toString().contains("ms"), true)
        @Expect(d.toString().contains("us"), true)
        @Expect(d.toString().contains("ns"), true)
        @Expect(d.toString().contains("d"), false)
    }

    @TestCase
    func testInt64MultiplyNegativeAndMinusOne(): Unit {
        @Expect((Duration.Zero - Duration.second) * (-1), Duration.second)
        @Expect(Duration.second * (-2), Duration.Zero - Duration.second * 2)
        @Expect(Duration.second * (-1), Duration.Zero - Duration.second)
    }

    @TestCase
    func testAddNearMaxAndSubtractIdentity(): Unit {
        let nearMax = Duration.Max - Duration.nanosecond
        @Expect(nearMax + Duration.nanosecond, Duration.Max)
        @Expect(Duration.second - Duration.second, Duration.Zero)
    }

    @TestCase
    func testGetRealSecondNegativeSecPositiveNs(): Unit {
        let d = Duration.Zero - Duration.second + Duration.nanosecond * 500000000
        @Expect(d.toSeconds(), 0)
        @Expect(d.toDays(), 0)
    }

    @TestCase
    func testNegativeDurationLargeIntDivisorBranch(): Unit {
        let neg = Duration.Zero - Duration.day
        let r = neg / 0x1_0000_0001_i64
        @Expect(r.toNanoseconds() < 0, true)
    }

    @TestCase
    func testInt64MultiplyOnMaxThrows(): Unit {
        @ExpectThrows[ArithmeticException](Duration.Max * 3)
    }

    @TestCase
    func testFloat64DivideOutOfRangeThrows(): Unit {
        @ExpectThrows[ArithmeticException](Duration.second / 1.0e-300)
    }

    @TestCase
    func testPositiveLargeIntDivisorUsesDurDiv(): Unit {
        let huge = Duration.day * 10000
        let r = huge / 0x1_0000_0002_i64
        @Expect(r.toNanoseconds() > 0, true)
    }

    @TestCase
    func testNegativeIntDivideEvenSplit(): Unit {
        let neg = Duration.Zero - Duration.hour
        @Expect(neg / 2, Duration.Zero - Duration.minute * 30)
    }

    @TestCase
    func testToHoursMinutesOnNegativeDuration(): Unit {
        let d = Duration.Zero - Duration.hour - Duration.minute * 2
        @Expect(d.toHours() < 0, true)
        @Expect(d.toMinutes() < 0, true)
    }

    @TestCase
    func testCompareOperatorsViaLessThanOnly(): Unit {
        let a = Duration.millisecond * 100
        let b = Duration.millisecond * 200
        @Expect(a < b, true)
        @Expect(!(a >= b), true)
    }
}
