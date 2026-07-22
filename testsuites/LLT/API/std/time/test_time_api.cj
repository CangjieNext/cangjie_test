/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.time.*

@Test
public class TimeApiTest {

    // ===== DateTime.nowUTC() =====

    @TestCase
    func nowUTCBasic(): Unit {
        let dt = DateTime.nowUTC()
        @Expect(dt.zone == TimeZone.UTC)
        @Expect(dt.year >= 1970)
    }

    @TestCase
    func nowUTCEqualsNowWithUTCZone(): Unit {
        let dt1 = DateTime.nowUTC()
        let dt2 = DateTime.now(timeZone: TimeZone.UTC)
        // Both should be very close (within a few seconds)
        let diff = dt2.toUnixTimeStamp().toSeconds() - dt1.toUnixTimeStamp().toSeconds()
        @Expect(diff >= -5 && diff <= 5)
    }

    // ===== DateTime.now(timeZone:) with explicit timezone =====

    @TestCase
    func nowWithExplicitTimeZone(): Unit {
        let tz = TimeZone.load("Asia/Shanghai")
        let dt = DateTime.now(timeZone: tz)
        @Expect(dt.zone == tz)
        @Expect(dt.year >= 1970)
    }

    @TestCase
    func nowWithFixedTimeZone(): Unit {
        let fixedTz = TimeZone("Fixed+05", Duration.hour * 5)
        let dt = DateTime.now(timeZone: fixedTz)
        @Expect(dt.zone == fixedTz)
    }

    // ===== DateTime.tryParse() success case =====

    @TestCase
    func tryParseSuccess(): Unit {
        let result = DateTime.tryParse("2023-04-10T12:30:45Z")
        match (result) {
            case Some(dt) =>
                @Expect(dt.year, 2023)
                @Expect(dt.month == April)
                @Expect(dt.dayOfMonth, 10)
                @Expect(dt.hour, 12)
                @Expect(dt.minute, 30)
                @Expect(dt.second, 45)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func tryParseSuccessWithNanoseconds(): Unit {
        let result = DateTime.tryParse("2023-04-10T12:30:45.123456789+08:00")
        match (result) {
            case Some(dt) =>
                @Expect(dt.year, 2023)
                @Expect(dt.nanosecond, 123456789)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func tryParseFailure(): Unit {
        let result = DateTime.tryParse("invalid-string")
        match (result) {
            case Some(_) =>
                @Assert(false)
            case None =>
                @Expect(true)
        }
    }

    // ===== DateTime - Duration.Min (special branch: r.sec == Int64.Min) =====

    @TestCase
    func subDurationMinThrows(): Unit {
        let dt = DateTime.UnixEpoch
        try {
            let _ = dt - Duration.Min
            @Assert(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    // ===== DayOfWeek.toInteger() direct calls =====

    @TestCase
    func dayOfWeekToInteger(): Unit {
        @Expect(Sunday.toInteger(), 0)
        @Expect(Monday.toInteger(), 1)
        @Expect(Tuesday.toInteger(), 2)
        @Expect(Wednesday.toInteger(), 3)
        @Expect(Thursday.toInteger(), 4)
        @Expect(Friday.toInteger(), 5)
        @Expect(Saturday.toInteger(), 6)
    }

    // ===== Month.toInteger() direct calls =====

    @TestCase
    func monthToInteger(): Unit {
        @Expect(January.toInteger(), 1)
        @Expect(February.toInteger(), 2)
        @Expect(March.toInteger(), 3)
        @Expect(April.toInteger(), 4)
        @Expect(May.toInteger(), 5)
        @Expect(June.toInteger(), 6)
        @Expect(July.toInteger(), 7)
        @Expect(August.toInteger(), 8)
        @Expect(September.toInteger(), 9)
        @Expect(October.toInteger(), 10)
        @Expect(November.toInteger(), 11)
        @Expect(December.toInteger(), 12)
    }

    // ===== MonoTime != operator =====

    @TestCase
    func monoTimeNotEqual(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 + Duration.second
        @Expect(m1 != m2)

        let m3 = m1 + Duration.second - Duration.second
        @Expect(m1 == m3)
        @Expect(!(m1 != m3))
    }

    // ===== TimeZone.load("Local") returns TimeZone.Local =====

    @TestCase
    func loadLocalReturnsLocal(): Unit {
        let tz = TimeZone.load("Local")
        @Expect(tz == TimeZone.Local)
    }

    @TestCase
    func loadLocalId(): Unit {
        let tz = TimeZone.load("Local")
        @Expect(tz.id == TimeZone.Local.id)
    }

    // ===== TimeZone != operator =====

    @TestCase
    func timeZoneNotEqual(): Unit {
        let tz1 = TimeZone.UTC
        let tz2 = TimeZone.load("Asia/Shanghai")
        @Expect(tz1 != tz2)
        @Expect(!(tz1 != tz1))
    }

    // ===== GMT offset format with double-digit hour (res[1] != '0') =====

    @TestCase
    func gmtOffsetDoubleDigitHour(): Unit {
        // offset = +12 hours -> toOffsetString(1) returns "+12", res[1]='1' != '0'
        let tz = TimeZone("GMT+12", Duration.hour * 12)
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: tz)
        @Expect(dt.format("Z"), "GMT+12")
        @Expect(dt.format("ZZ"), "GMT+12:00")
    }

    @TestCase
    func gmtOffsetNegativeDoubleDigitHour(): Unit {
        let tz = TimeZone("GMT-10", Duration.hour * -10)
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: tz)
        @Expect(dt.format("Z"), "GMT-10")
        @Expect(dt.format("ZZ"), "GMT-10:00")
    }

    // ===== DateTime.of with Month enum and ofUTC with Month enum =====

    @TestCase
    func ofWithMonthEnum(): Unit {
        let dt = DateTime.of(year: 2023, month: June, dayOfMonth: 15, hour: 10, minute: 30, second: 45,
            nanosecond: 123, timeZone: TimeZone.UTC)
        @Expect(dt.year, 2023)
        @Expect(dt.month == June)
        @Expect(dt.dayOfMonth, 15)
        @Expect(dt.hour, 10)
        @Expect(dt.minute, 30)
        @Expect(dt.second, 45)
        @Expect(dt.nanosecond, 123)
    }

    @TestCase
    func ofUTCWithMonthEnum(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: December, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999)
        @Expect(dt.year, 2023)
        @Expect(dt.month == December)
        @Expect(dt.dayOfMonth, 31)
        @Expect(dt.hour, 23)
        @Expect(dt.minute, 59)
        @Expect(dt.second, 59)
        @Expect(dt.nanosecond, 999999999)
    }

    // ===== DateTime parse with format string (non-deprecated overload) =====

    @TestCase
    func parseWithFormatString(): Unit {
        let dt = DateTime.parse("2023/06/15 10:30:45", "yyyy/MM/dd HH:mm:ss")
        @Expect(dt.year, 2023)
        @Expect(dt.month == June)
        @Expect(dt.dayOfMonth, 15)
        @Expect(dt.hour, 10)
        @Expect(dt.minute, 30)
        @Expect(dt.second, 45)
    }

    @TestCase
    func formatWithFormatString(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45)
        @Expect(dt.format("yyyy/MM/dd HH:mm:ss"), "2023/06/15 10:30:45")
    }

    // ===== DateTime.toString with negative year =====

    @TestCase
    func toStringNegativeYear(): Unit {
        let dt = DateTime.parse("-2020-02-29T00:00:00Z")
        @Expect(dt.toString(), "-2020-02-29T00:00:00Z")
        @Expect(dt.year, -2020)
    }

    // ===== DateTime edge cases: leap year boundary =====

    @TestCase
    func leapYearFeb29(): Unit {
        let dt = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        @Expect(dt.dayOfYear, 60)
        @Expect(dt.month == February)
        @Expect(dt.dayOfMonth, 29)
    }

    @TestCase
    func nonLeapYearFeb28(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 2, dayOfMonth: 28)
        @Expect(dt.dayOfYear, 59)
        @Expect(dt.month == February)
        @Expect(dt.dayOfMonth, 28)
    }

    @TestCase
    func leapYearDec31(): Unit {
        let dt = DateTime.ofUTC(year: 2020, month: 12, dayOfMonth: 31)
        @Expect(dt.dayOfYear, 366)
    }

    @TestCase
    func nonLeapYearDec31(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 31)
        @Expect(dt.dayOfYear, 365)
    }

    // ===== DateTime.ofEpoch boundary values =====

    @TestCase
    func ofEpochMaxNanosecond(): Unit {
        let dt = DateTime.ofEpoch(second: 0, nanosecond: 999999999)
        @Expect(dt == DateTime.UnixEpoch + Duration.nanosecond * 999999999)
        @Expect(dt.nanosecond, 999999999)
    }

    @TestCase
    func ofEpochZeroNanosecond(): Unit {
        let dt = DateTime.ofEpoch(second: 0, nanosecond: 0)
        @Expect(dt == DateTime.UnixEpoch)
        @Expect(dt.nanosecond, 0)
    }

    @TestCase
    func ofEpochNegativeSecond(): Unit {
        let dt = DateTime.ofEpoch(second: -1, nanosecond: 0)
        @Expect(dt == DateTime.UnixEpoch - Duration.second)
        @Expect(dt.year, 1969)
        @Expect(dt.month == December)
        @Expect(dt.dayOfMonth, 31)
        @Expect(dt.hour, 23)
        @Expect(dt.minute, 59)
        @Expect(dt.second, 59)
    }

    // ===== DateTime fromUnixTimeStamp and toUnixTimeStamp roundtrip =====

    @TestCase
    func unixTimeStampRoundtrip(): Unit {
        let original = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45,
            nanosecond: 123456789)
        let ts = original.toUnixTimeStamp()
        let restored = DateTime.fromUnixTimeStamp(ts)
        @Expect(original == restored)
    }

    @TestCase
    func unixTimeStampZero(): Unit {
        @Expect(DateTime.UnixEpoch.toUnixTimeStamp(), Duration.Zero)
        @Expect(DateTime.fromUnixTimeStamp(Duration.Zero) == DateTime.UnixEpoch)
    }

    // ===== DateTime addYears leap day edge case =====

    @TestCase
    func addYearsFromLeapDay(): Unit {
        let dt = DateTime.ofUTC(year: 2020, month: 2, dayOfMonth: 29)
        // Adding 1 year to Feb 29 should give Feb 28 (non-leap year)
        let result = dt.addYears(1)
        @Expect(result.year, 2021)
        @Expect(result.month == February)
        @Expect(result.dayOfMonth, 28)
    }

    @TestCase
    func addYearsToLeapDay(): Unit {
        let dt = DateTime.ofUTC(year: 2019, month: 2, dayOfMonth: 28)
        // Adding 1 year to Feb 28 in non-leap year stays Feb 28
        let result = dt.addYears(1)
        @Expect(result.year, 2020)
        @Expect(result.month == February)
        @Expect(result.dayOfMonth, 28)
    }

    // ===== DateTime addMonths edge cases =====

    @TestCase
    func addMonthsFromJan31(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 31)
        // Jan 31 + 1 month = Feb 28 (clamped to last day of Feb)
        let result = dt.addMonths(1)
        @Expect(result.year, 2023)
        @Expect(result.month == February)
        @Expect(result.dayOfMonth, 28)
    }

    @TestCase
    func addMonthsWrapYear(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 12, dayOfMonth: 15)
        let result = dt.addMonths(3)
        @Expect(result.year, 2024)
        @Expect(result.month == March)
        @Expect(result.dayOfMonth, 15)
    }

    @TestCase
    func subMonthsWrapYear(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 15)
        let result = dt.addMonths(-2)
        @Expect(result.year, 2022)
        @Expect(result.month == November)
        @Expect(result.dayOfMonth, 15)
    }

    // ===== DateTime comparison operators =====

    @TestCase
    func dateTimeEqualAndNotEqual(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        let dt2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        @Expect(dt1 == dt2)
        @Expect(!(dt1 != dt2))

        let dt3 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 11)
        @Expect(dt1 != dt3)
        @Expect(!(dt1 == dt3))
    }

    @TestCase
    func dateTimeLessGreaterEqual(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        let dt2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 11)
        @Expect(dt1 < dt2)
        @Expect(dt1 <= dt2)
        @Expect(dt2 > dt1)
        @Expect(dt2 >= dt1)
        @Expect(dt1 <= dt1)
        @Expect(dt1 >= dt1)
    }

    // ===== DateTime hashCode consistency =====

    @TestCase
    func hashCodeConsistency(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45,
            nanosecond: 100)
        let dt2 = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45,
            nanosecond: 100)
        @Expect(dt1.hashCode() == dt2.hashCode())

        // Same instant in different timezones should have same hash
        let dt3 = DateTime.of(year: 2023, month: 6, dayOfMonth: 15, hour: 18, minute: 30, second: 45,
            nanosecond: 100, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dt1.hashCode() == dt3.hashCode())
    }

    // ===== DateTime compare function returns Ordering =====

    @TestCase
    func compareFunction(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        let dt2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        let dt3 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 11)
        @Expect(dt1.compare(dt2), Ordering.EQ)
        @Expect(dt1.compare(dt3), Ordering.LT)
        @Expect(dt3.compare(dt1), Ordering.GT)
    }

    // ===== DateTime subtraction returns Duration =====

    @TestCase
    func dateTimeSubtraction(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10, hour: 12)
        let dt2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10, hour: 10)
        let dur = dt1 - dt2
        @Expect(dur, Duration.hour * 2)
    }

    @TestCase
    func dateTimeSubtractionNegative(): Unit {
        let dt1 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10, hour: 10)
        let dt2 = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10, hour: 12)
        let dur = dt1 - dt2
        @Expect(dur, Duration.hour * -2)
    }

    // ===== DateTime + Duration and - Duration operators =====

    @TestCase
    func addDurationOperator(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1)
        let result = dt + Duration.day
        @Expect(result, DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 2))
    }

    @TestCase
    func subDurationOperator(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 2)
        let result = dt - Duration.day
        @Expect(result, DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1))
    }

    @TestCase
    func addDurationWithNanosecondOverflow(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 999999999)
        let result = dt + Duration.nanosecond
        @Expect(result, DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 1,
            nanosecond: 0))
    }

    @TestCase
    func subDurationWithNanosecondUnderflow(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 0)
        let result = dt - Duration.nanosecond
        @Expect(result, DateTime.ofUTC(year: 2022, month: 12, dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999))
    }

    // ===== DateTime zone and zoneId properties =====

    @TestCase
    func zoneAndZoneId(): Unit {
        let tz = TimeZone.load("Asia/Shanghai")
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: tz)
        @Expect(dt.zone == tz)
        @Expect(dt.zoneId, "Asia/Shanghai")
    }

    @TestCase
    func zoneAndZoneIdUTC(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        @Expect(dt.zone == TimeZone.UTC)
        @Expect(dt.zoneId, "UTC")
    }

    // ===== DateTime zoneOffset for fixed timezone =====

    @TestCase
    func zoneOffsetFixedTz(): Unit {
        let tz = TimeZone("GMT+0530", Duration.hour * 5 + Duration.minute * 30)
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: tz)
        @Expect(dt.zoneOffset, Duration.hour * 5 + Duration.minute * 30)
    }

    @TestCase
    func zoneOffsetNegativeTz(): Unit {
        let tz = TimeZone("GMT-0800", Duration.hour * -8)
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: tz)
        @Expect(dt.zoneOffset, Duration.hour * -8)
    }

    // ===== DateTime inUTC, inLocal, inTimeZone =====

    @TestCase
    func inUTCPreservesInstant(): Unit {
        let tz = TimeZone.load("Asia/Shanghai")
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, hour: 12, timeZone: tz)
        let utc = dt.inUTC()
        @Expect(utc.toUnixTimeStamp() == dt.toUnixTimeStamp())
        @Expect(utc.zone == TimeZone.UTC)
    }

    @TestCase
    func inLocalPreservesInstant(): Unit {
        let tz = TimeZone.load("Asia/Shanghai")
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, hour: 12, timeZone: tz)
        let local = dt.inLocal()
        @Expect(local.toUnixTimeStamp() == dt.toUnixTimeStamp())
    }

    @TestCase
    func inTimeZonePreservesInstant(): Unit {
        let tz1 = TimeZone.load("Asia/Shanghai")
        let tz2 = TimeZone.load("America/New_York")
        let dt = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, hour: 12, timeZone: tz1)
        let converted = dt.inTimeZone(tz2)
        @Expect(converted.toUnixTimeStamp() == dt.toUnixTimeStamp())
        @Expect(converted.zone == tz2)
    }

    // ===== DateTime date and time properties =====

    @TestCase
    func dateProperty(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15)
        let (y, m, d) = dt.date
        @Expect(y, 2023)
        @Expect(m == June)
        @Expect(d, 15)
    }

    @TestCase
    func timeProperty(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45)
        let (h, m, s) = dt.time
        @Expect(h, 10)
        @Expect(m, 30)
        @Expect(s, 45)
    }

    // ===== DateTime isoWeek property =====

    @TestCase
    func isoWeekBasic(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 4)
        let (year, week) = dt.isoWeek
        @Expect(year, 2023)
        @Expect(week, 1)
    }

    @TestCase
    func isoWeekYearBoundary(): Unit {
        // 2021-01-01 is in ISO week 53 of 2020
        let dt = DateTime.ofUTC(year: 2021, month: 1, dayOfMonth: 1)
        let (year, week) = dt.isoWeek
        @Expect(year, 2020)
        @Expect(week, 53)
    }

    // ===== DayOfWeek + and - operators =====

    @TestCase
    func dayOfWeekAdd(): Unit {
        @Expect(Monday + 1, Tuesday)
        @Expect(Friday + 2, Sunday)
        @Expect(Sunday + 7, Sunday)
        @Expect(Wednesday + 10, Wednesday)
    }

    @TestCase
    func dayOfWeekSub(): Unit {
        @Expect(Tuesday - 1, Monday)
        @Expect(Sunday - 1, Saturday)
        @Expect(Monday - 7, Monday)
        @Expect(Wednesday - 10, Wednesday)
    }

    // ===== Month + and - operators =====

    @TestCase
    func monthAdd(): Unit {
        @Expect(January + 1, February)
        @Expect(November + 2, January)
        @Expect(June + 12, June)
    }

    @TestCase
    func monthSub(): Unit {
        @Expect(March - 1, February)
        @Expect(January - 1, December)
        @Expect(June - 12, June)
    }

    // ===== TimeParseException and InvalidDataException =====

    @TestCase
    func timeParseExceptionWithMessage(): Unit {
        let exc = TimeParseException("test error")
        @Expect(exc.message, "test error")
    }

    @TestCase
    func timeParseExceptionToString(): Unit {
        let exc = TimeParseException()
        @Expect(exc.toString(), "TimeParseException")
    }

    @TestCase
    func invalidDataExceptionWithMessage(): Unit {
        let exc = InvalidDataException("bad data")
        @Expect(exc.message, "bad data")
    }

    @TestCase
    func invalidDataExceptionToString(): Unit {
        let exc = InvalidDataException()
        @Expect(exc.toString(), "InvalidDataException")
    }

    // ===== DateTimeFormat constants =====

    @TestCase
    func dateTimeFormatConstants(): Unit {
        @Expect(DateTimeFormat.RFC3339, "yyyy-MM-ddTHH:mm:ssOOOO")
        @Expect(DateTimeFormat.RFC1123, "www, dd MMM yyyy HH:mm:ss z")
        @Expect(DateTimeFormat.RFC822, "ww dd MMM yy HH:mm:ss z")
        @Expect(DateTimeFormat.RFC850, "wwww, dd-MMM-yy HH:mm:ss z")
    }

    // ===== DateTime parse with RFC3339 (default) =====

    @TestCase
    func parseDefaultRFC3339(): Unit {
        let dt = DateTime.parse("2023-06-15T10:30:45Z")
        @Expect(dt.year, 2023)
        @Expect(dt.month == June)
        @Expect(dt.dayOfMonth, 15)
        @Expect(dt.hour, 10)
        @Expect(dt.minute, 30)
        @Expect(dt.second, 45)
        @Expect(dt.zoneId, "UTC")
    }

    // ===== DateTime toString with nanoseconds =====

    @TestCase
    func toStringWithNanoseconds(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45,
            nanosecond: 123456789)
        @Expect(dt.toString(), "2023-06-15T10:30:45.123456789Z")
    }

    @TestCase
    func toStringWithTrailingZeroNanoseconds(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45,
            nanosecond: 123000000)
        @Expect(dt.toString(), "2023-06-15T10:30:45.123Z")
    }

    @TestCase
    func toStringWithSingleDigitNanosecond(): Unit {
        let dt = DateTime.ofUTC(year: 2023, month: 6, dayOfMonth: 15, hour: 10, minute: 30, second: 45,
            nanosecond: 100000000)
        @Expect(dt.toString(), "2023-06-15T10:30:45.1Z")
    }

    // ===== DateTime dayOfWeek property =====

    @TestCase
    func dayOfWeekProperty(): Unit {
        // 2023-01-01 is Sunday
        let dt = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 1)
        @Expect(dt.dayOfWeek == Sunday)

        // 2023-01-02 is Monday
        let dt2 = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 2)
        @Expect(dt2.dayOfWeek == Monday)

        // 2023-01-07 is Saturday
        let dt3 = DateTime.ofUTC(year: 2023, month: 1, dayOfMonth: 7)
        @Expect(dt3.dayOfWeek == Saturday)
    }

    // ===== DateTime now and monotonic time =====

    @TestCase
    func nowReturnsValidTime(): Unit {
        let now = DateTime.now()
        @Expect(now.year >= 2024)
        let m = now.month.toInteger()
        @Expect(m >= 1 && m <= 12)
        @Expect(now.dayOfMonth >= 1 && now.dayOfMonth <= 31)
        @Expect(now.hour >= 0 && now.hour <= 23)
        @Expect(now.minute >= 0 && now.minute <= 59)
        @Expect(now.second >= 0 && now.second <= 59)
    }

    // ===== MonoTime basic operations =====

    @TestCase
    func monoTimeNowNonDecreasing(): Unit {
        let m1 = MonoTime.now()
        let m2 = MonoTime.now()
        @Expect(m2 >= m1)
    }

    @TestCase
    func monoTimeCompare(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 + Duration.second
        @Expect(m1.compare(m2), Ordering.LT)
        @Expect(m2.compare(m1), Ordering.GT)

        let m3 = m1 + Duration.second - Duration.second
        @Expect(m1.compare(m3), Ordering.EQ)
    }

    // ===== MonoTime subtraction returns Duration =====

    @TestCase
    func monoTimeSubtraction(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 + Duration.second
        let dur = m2 - m1
        @Expect(dur, Duration.second)
    }

    // ===== MonoTime hashCode =====

    @TestCase
    func monoTimeHashCode(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 + Duration.second - Duration.second
        @Expect(m1.hashCode() == m2.hashCode())
    }
}
