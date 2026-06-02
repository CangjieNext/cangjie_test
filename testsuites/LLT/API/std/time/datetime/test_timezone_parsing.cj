/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./test_datetime_pub.cj
// EXEC: %compiler %cmp_opt %f test_datetime_pub.cj %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args

import std.time.*

@Test
public class TimezoneParsingTest {
    @TestCase
    func parseValidTimezoneData(): Unit {
        // Test that valid timezone data can be parsed
        let tz = TimeZone.load("America/New_York")
        
        // Check that timezone is loaded correctly
        @Expect(tz.id, "America/New_York")
        @Expect(tz.toString(), "America/New_York")
    }

    @TestCase
    func parseTimezoneWithMultipleTransitions(): Unit {
        // Test timezone with many historical transitions
        let tz = TimeZone.load("Europe/London")
        
        // Check multiple time points using DateTime
        let dt1 = DateTime.fromUnixTimeStamp(Duration.Zero).inTimeZone(tz)
        @Expect(dt1.year, 1970)
        
        let dt2 = DateTime.of(year: 2000, month: 1, dayOfMonth: 1, timeZone: tz)
        @Expect(dt2.year, 2000)
        
        let dt3 = DateTime.of(year: 2022, month: 1, dayOfMonth: 1, timeZone: tz)
        @Expect(dt3.year, 2022)
        
        let dt4 = DateTime.of(year: 2022, month: 8, dayOfMonth: 1, timeZone: tz)
        @Expect(dt4.year, 2022)
    }

    @TestCase
    func parseTimezoneWithLargeOffset(): Unit {
        // Test timezone with large positive offset (Pacific/Kiritimati: UTC+14)
        let tz = TimeZone.load("Pacific/Kiritimati")
        
        // Create a datetime and verify the offset
        let dt = DateTime.of(year: 2022, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, timeZone: tz)
        // UTC+14 = 14 hours = 50400 seconds
        @Expect(dt.zoneOffset, Duration.hour * 14)
    }

    @TestCase
    func parseTimezoneWithNegativeOffset(): Unit {
        // Test timezone with large negative offset (Pacific/Niue: UTC-11)
        let tz = TimeZone.load("Pacific/Niue")
        
        // Create a datetime and verify the offset
        let dt = DateTime.of(year: 2022, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, timeZone: tz)
        // UTC-11 = -11 hours = -39600 seconds
        @Expect(dt.zoneOffset, Duration.hour * -11)
    }

    @TestCase
    func parseTimezoneNearEpoch(): Unit {
        // Test timezone parsing near Unix epoch
        let tz = TimeZone.load("UTC")
        
        let dt1 = DateTime.fromUnixTimeStamp(Duration.Zero).inTimeZone(tz)
        @Expect(dt1.zoneOffset, Duration.Zero)
        
        let dt2 = DateTime.ofUTC(year: 1970, month: 1, dayOfMonth: 1)
        @Expect(dt2.zoneOffset, Duration.Zero)
    }

    @TestCase
    func parseTimezoneWithDSTTransitions(): Unit {
        // Test timezone with DST transitions
        let tz = TimeZone.load("America/Los_Angeles")
        
        // Before DST 2022 (PST: UTC-8) - March 12, 2022 at 1:59 AM is still PST
        let beforeDst = DateTime.of(year: 2022, month: 3, dayOfMonth: 12, hour: 1, minute: 59, second: 59,
            timeZone: tz)
        // PST: UTC-8 = -8 hours
        @Expect(beforeDst.zoneOffset, Duration.hour * -8)
        
        // After DST 2022 starts - March 13, 2022 at 3:00 AM is PDT
        // DST starts at 2:00 AM on March 13, clocks spring forward to 3:00 AM
        let afterDst = DateTime.of(year: 2022, month: 3, dayOfMonth: 13, hour: 3, minute: 0, second: 0,
            timeZone: tz)
        // PDT: UTC-7 = -7 hours
        @Expect(afterDst.zoneOffset, Duration.hour * -7)
    }

    @TestCase
    func parseTimezoneFarFuture(): Unit {
        // Test timezone parsing for far future dates
        let tz = TimeZone.load("Asia/Tokyo")
        
        // Year 2100
        let farFuture = DateTime.of(year: 2100, month: 1, dayOfMonth: 1, timeZone: tz)
        // JST: UTC+9 = 9 hours
        @Expect(farFuture.zoneOffset, Duration.hour * 9)
    }

    @TestCase
    func parseTimezoneFarPast(): Unit {
        // Test timezone parsing for far past dates
        let tz = TimeZone.load("Asia/Tokyo")
        
        // Year 1900
        let farPast = DateTime.of(year: 1900, month: 1, dayOfMonth: 1, timeZone: tz)
        // Just verify it doesn't crash and returns a valid offset
        let offset = farPast.zoneOffset
        @Expect(offset >= Duration.hour * -12 && offset <= Duration.hour * 14)
    }

    @TestCase
    func parseUTCOffset(): Unit {
        // Test UTC timezone
        let utc = TimeZone.UTC
        @Expect(utc.id, "UTC")
        
        let dt = DateTime.of(year: 2022, month: 1, dayOfMonth: 1, timeZone: utc)
        @Expect(dt.zoneOffset, Duration.Zero)
    }

    @TestCase
    func parseCustomTimezone(): Unit {
        // Test custom timezone with fixed offset
        let customTz = TimeZone("UTC+05:30", Duration.hour * 5 + Duration.minute * 30)
        @Expect(customTz.id, "UTC+05:30")
        
        let dt = DateTime.of(year: 2022, month: 1, dayOfMonth: 1, timeZone: customTz)
        @Expect(dt.zoneOffset, Duration.hour * 5 + Duration.minute * 30)
    }

    @TestCase
    func parseTimezoneFromTZData(): Unit {
        // Test loading timezone from TZData
        // This tests the fix for: add upper bounds for tzif field counts
        let tz = TimeZone.load("Asia/Shanghai")
        @Expect(tz.id, "Asia/Shanghai")
        
        let dt = DateTime.of(year: 2022, month: 1, dayOfMonth: 1, timeZone: tz)
        // CST: UTC+8
        @Expect(dt.zoneOffset, Duration.hour * 8)
    }
}
