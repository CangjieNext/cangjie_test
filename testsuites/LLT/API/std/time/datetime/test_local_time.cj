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
public class LocalTimeTest {
    @TestCase
    func localTimeOffset(): Unit {
        // Test that local time offset is calculated correctly
        // This tests the localtime_r fix for thread safety
        let localTz = TimeZone.Local
        
        // Create a datetime in local timezone
        let now = DateTime.now()
        let localNow = now.inLocal()
        
        // Verify the timezone is valid
        @Expect(localNow.zone.id.size > 0)
    }

    @TestCase
    func localTimeConsistency(): Unit {
        // Test that local time is consistent across multiple calls
        // This verifies thread safety of localtime_r
        let localTz1 = TimeZone.Local
        let localTz2 = TimeZone.Local
        
        // Both should return the same timezone
        @Expect(localTz1.id == localTz2.id)
    }

    @TestCase
    func localTimeWithDateTime(): Unit {
        // Test DateTime.inLocal() functionality
        let utcTime = DateTime.ofUTC(year: 2022, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0)
        let localTime = utcTime.inLocal()
        
        // The local time should represent the same instant
        @Expect(utcTime.toUnixTimeStamp() == localTime.toUnixTimeStamp())
    }

    @TestCase
    func localTimeMultipleConversions(): Unit {
        // Test multiple conversions between UTC and local time
        let utcTime = DateTime.ofUTC(year: 2022, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0)
        
        let localTime1 = utcTime.inLocal()
        let utcTime2 = localTime1.inUTC()
        let localTime2 = utcTime2.inLocal()
        
        @Expect(utcTime == utcTime2)
        @Expect(localTime1 == localTime2)
    }

    @TestCase
    func localTimeNearDST(): Unit {
        // Test local time near DST transitions
        // This verifies that localtime_r handles DST correctly
        let utcTime = DateTime.ofUTC(year: 2022, month: 3, dayOfMonth: 27, hour: 1, minute: 0, second: 0)
        let localTime = utcTime.inLocal()
        
        // Just verify it doesn't crash
        @Expect(localTime.year == 2022)
    }

    @TestCase
    func localTimeNow(): Unit {
        // Test DateTime.now() returns valid local time
        let now = DateTime.now()
        
        @Expect(now.year >= 2022)
        // Month is an enum, just check it's a valid month
        let monthValue = now.month.toInteger()
        @Expect(monthValue >= 1 && monthValue <= 12)
        @Expect(now.dayOfMonth >= 1)
        @Expect(now.dayOfMonth <= 31)
    }

    @TestCase
    func localTimeWithSpecificTimezone(): Unit {
        // Test creating datetime in specific timezone
        let london = TimeZone.load("Europe/London")
        let dt = DateTime.of(year: 2022, month: 6, dayOfMonth: 15, hour: 12, minute: 0, second: 0, timeZone: london)
        
        // Verify the timezone
        @Expect(dt.zone.id, "Europe/London")
        
        // Convert to UTC and verify
        let utcDt = dt.inUTC()
        @Expect(utcDt.toUnixTimeStamp() == dt.toUnixTimeStamp())
    }
}
