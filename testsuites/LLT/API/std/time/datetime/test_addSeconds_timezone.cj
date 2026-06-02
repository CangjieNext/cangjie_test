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
public class AddSecondsTimezoneTest {
    @TestCase
    func addSecondsCrossTimezoneBoundary(): Unit {
        // Test that addSeconds uses the correct timestamp for timezone lookup
        // This test verifies the fix for: addSeconds uses correct timestamp for timezone lookup
        // Before fix: used original timestamp to lookup timezone offset
        // After fix: uses new timestamp (after adding seconds) to lookup timezone offset
        
        // Europe/London DST transition: 2022-03-27 01:00 GMT -> 02:00 BST (clocks forward)
        // At 01:00 GMT, offset is 0; after transition, offset is +3600 (1 hour)
        // Note: At 01:59:59 GMT, adding 1 second jumps to 03:00:00 BST (skipping 02:00-02:59:59)
        let london = TimeZone.load("Europe/London")
        
        // Just before DST transition (01:59:59 GMT, offset 0)
        let beforeDst = DateTime.of(year: 2022, month: 3, dayOfMonth: 27, hour: 1, minute: 59, second: 59,
            timeZone: london)
        // Adding 1 second should cross DST boundary
        let afterDst = beforeDst.addSeconds(1)
        // Should be 03:00:00 BST (offset +01:00), because 02:00-02:59:59 is skipped
        @Expect(afterDst.toString(), "2022-03-27T03:00:00+01:00")
        
        // Verify the offset is correct after crossing DST using zoneOffset property
        @Expect(afterDst.zoneOffset, Duration.hour)
    }

    @TestCase
    func addSecondsCrossTimezoneBoundaryReverse(): Unit {
        // Test reverse: crossing DST boundary backwards
        // 2022-10-30 02:00 BST -> 01:00 GMT (clocks back)
        // DST ends at 02:00 BST = 01:00 UTC, clocks go back to 01:00 GMT = 01:00 UTC
        let london = TimeZone.load("Europe/London")
        
        // At 00:30 BST on Oct 30 (offset +01:00) = 23:30 UTC on Oct 29
        let beforeEndDst = DateTime.of(year: 2022, month: 10, dayOfMonth: 30, hour: 0, minute: 30, second: 0,
            timeZone: london)
        // Adding 3 hours: 23:30 UTC + 3h = 02:30 UTC on Oct 30
        // After DST ends, 02:30 UTC = 02:30 GMT (offset 0)
        let afterEndDst = beforeEndDst.addSeconds(10800)
        // Verify the result
        @Expect(afterEndDst.hour, 2)
        @Expect(afterEndDst.minute, 30)
        // Verify offset is 0 (GMT)
        @Expect(afterEndDst.zoneOffset, Duration.Zero)
    }

    @TestCase
    func addSecondsWithLargeOffsetChange(): Unit {
        // Pacific/Honolulu DST: 1933-04-30 02:00 -10:00 -> 03:00 -09:30 (clocks forward 1.5 hours)
        // This tests a case where the offset change is not a simple 1 hour
        let honolulu = TimeZone.load("Pacific/Honolulu")
        
        // Just before DST transition (01:59:59 -10:00)
        let beforeDst = DateTime.of(year: 1933, month: 4, dayOfMonth: 30, hour: 1, minute: 59, second: 59,
            timeZone: honolulu)
        // Adding 1 second should cross DST boundary
        let afterDst = beforeDst.addSeconds(1)
        // Should be 03:00:00 -09:30 (skipped 02:00-02:59:59)
        @Expect(afterDst.toString(), "1933-04-30T03:00:00-09:30")
        
        // Verify the offset changed to -09:30 = -34200 seconds
        @Expect(afterDst.zoneOffset, Duration.minute * -570)
    }

    @TestCase
    func addSecondsMultipleDSTTransitions(): Unit {
        // Test adding seconds that cross multiple DST transitions
        let london = TimeZone.load("Europe/London")
        
        // Start in winter time (GMT, offset 0)
        let winterTime = DateTime.of(year: 2022, month: 1, dayOfMonth: 1, hour: 12, minute: 0, second: 0,
            timeZone: london)
        
        // Add 6 months worth of seconds (should cross into summer time)
        // 180 days from Jan 1 is June 30, not July
        let sixMonthsSeconds: Int64 = 180 * SECONDS_PER_DAY
        let summerTime = winterTime.addSeconds(sixMonthsSeconds)
        
        // Should be in June (summer time, BST, offset +01:00)
        @Expect(summerTime.month, Month.June)
        // Verify offset is +1 hour (BST)
        @Expect(summerTime.zoneOffset, Duration.hour)
    }

    @TestCase
    func addSecondsNearMaxYearWithTimezoneChange(): Unit {
        // Test that year boundary check uses correct timezone offset
        // This is important when the offset changes near year boundaries
        let london = TimeZone.load("Europe/London")
        
        // Create a datetime near max year in winter time (GMT)
        let nearMax = DateTime.of(year: 999999998, month: 12, dayOfMonth: 31, hour: 23, minute: 0, second: 0,
            timeZone: london)
        
        // Adding seconds should work correctly
        let result = nearMax.addSeconds(3600)
        @Expect(result.year, 999999999)
        @Expect(result.month, Month.January)
        @Expect(result.dayOfMonth, 1)
    }

    @TestCase
    func addSecondsNearMinYearWithTimezoneChange(): Unit {
        // Test that year boundary check uses correct timezone offset near min year
        let london = TimeZone.load("Europe/London")
        
        // Create a datetime near min year
        let nearMin = DateTime.of(year: -999999998, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            timeZone: london)
        
        // Subtracting more seconds to cross year boundary
        let result = nearMin.addSeconds(-86400)
        @Expect(result.year, -999999999)
    }

    @TestCase
    func addSecondsAcrossInternationalDateLine(): Unit {
        // Test adding seconds that cross the international date line
        // Pacific/Auckland: UTC+12 (winter) / UTC+13 (summer)
        let auckland = TimeZone.load("Pacific/Auckland")
        
        // Create a datetime near midnight
        let nearMidnight = DateTime.of(year: 2022, month: 6, dayOfMonth: 15, hour: 23, minute: 30, second: 0,
            timeZone: auckland)
        
        // Add 1 hour (should cross to next day)
        let nextDay = nearMidnight.addSeconds(3600)
        @Expect(nextDay.dayOfMonth, 16)
        @Expect(nextDay.hour, 0)
        @Expect(nextDay.minute, 30)
    }

    @TestCase
    func addSecondsConsistencyWithAddMinutes(): Unit {
        // Test that addSeconds is consistent with addMinutes
        let london = TimeZone.load("Europe/London")
        let dt = DateTime.of(year: 2022, month: 3, dayOfMonth: 27, hour: 0, minute: 0, second: 0,
            timeZone: london)
        
        // Add 180 minutes (3 hours, crossing DST)
        let byMinutes = dt.addMinutes(180)
        let bySeconds = dt.addSeconds(180 * 60)
        
        @Expect(byMinutes, bySeconds)
    }

    @TestCase
    func addSecondsConsistencyWithAddHours(): Unit {
        // Test that addSeconds is consistent with addHours
        let london = TimeZone.load("Europe/London")
        let dt = DateTime.of(year: 2022, month: 3, dayOfMonth: 27, hour: 0, minute: 0, second: 0,
            timeZone: london)
        
        // Add 3 hours (crossing DST)
        let byHours = dt.addHours(3)
        let bySeconds = dt.addSeconds(3 * 3600)
        
        @Expect(byHours, bySeconds)
    }
}
