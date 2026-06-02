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

@Test
class Test_of_monthValue {
    @TestCase
    func test_of_year_01(): Unit {
        let time = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let year = time.year
        @Assert(year, 999999999)
    }

    @TestCase
    func test_of_year_02(): Unit {
        let time = DateTime.of(year: -999999999, month: 1, dayOfMonth: 1, hour: 9, minute: 0, second: 0, nanosecond: 0)
        let year = time.year
        @Assert(year, -999999999)
    }

    @TestCase
    func test_of_year_03(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 1000000000, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
                nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Year value must be in [-999,999,999, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_year_04(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: -1000000000, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
                nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Year value must be in [-999,999,999, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_month_01(): Unit {
        var count = 0
        var monthValue: Month
        let monthArray: Array<Month> = [January, February, March, April, May, June, July, August, September, October,
            November, December]
        for (i in 1..=12) {
            monthValue = DateTime
                .of(year: 999999999, month: i, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
                .month
            if (monthValue == monthArray[i - 1]) {
                count += 1
            }
        }
        @Assert(count, 12)
    }

    @TestCase
    func test_of_dayOfMonth_01(): Unit {
        let time = DateTime.of(year: 2008, month: 2, dayOfMonth: 29, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.dayOfMonth
        @Assert(day, 29)
    }

    @TestCase
    func test_of_dayOfMonth_02(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 2, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Day of February in 2008 must be in [1, 29].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_dayOfMonth_03(): Unit {
        let time = DateTime.of(year: 2000, month: 2, dayOfMonth: 29, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.dayOfMonth
        @Assert(day, 29)
    }

    @TestCase
    func test_of_dayOfMonth_04(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2000, month: 2, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Day of February in 2000 must be in [1, 29].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_dayOfMonth_05(): Unit {
        let time = DateTime.of(year: 1900, month: 2, dayOfMonth: 28, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.dayOfMonth
        @Assert(day, 28)
    }

    @TestCase
    func test_of_dayOfMonth_06(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 1900, month: 2, dayOfMonth: 29, hour: 0, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Day of February in 1900 must be in [1, 28].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_dayOfMonth_07(): Unit {
        let time = DateTime.of(year: 2023, month: 2, dayOfMonth: 28, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.dayOfMonth
        @Assert(day, 28)
    }

    @TestCase
    func test_of_dayOfMonth_08(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2023, month: 2, dayOfMonth: 29, hour: 0, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Day of February in 2023 must be in [1, 28].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_dayOfMonth_09(): Unit {
        let time = DateTime.of(year: 1900, month: 1, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.dayOfMonth
        @Assert(day, 31)
    }

    @TestCase
    func test_of_dayOfMonth_10(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 1900, month: 1, dayOfMonth: 32, hour: 0, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Day of January in 1900 must be in [1, 31].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_dayOfMonth_11(): Unit {
        let time = DateTime.of(year: 1900, month: 4, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.dayOfMonth
        @Assert(day, 30)
    }

    @TestCase
    func test_of_dayOfMonth_12(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 1900, month: 4, dayOfMonth: 31, hour: 0, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Day of April in 1900 must be in [1, 30].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_dayOfMonth_13(): Unit {
        var count = 0
        let monthArray: Array<Month> = [January, March, May, July, August, October, December]

        for (i in 0..7) {
            try {
                let time = DateTime.of(year: 1900, month: monthArray[i], dayOfMonth: 0, hour: 0, minute: 0, second: 0,
                    nanosecond: 0)
            } catch (e: IllegalArgumentException) {
                @Assert(e.message, "Day of ${monthArray[i]} in 1900 must be in [1, 31].")
                count += 1
            }
        }
        @Assert(count, 7)
    }

    @TestCase
    func test_of_Hour_01(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.hour
        @Assert(day, 0)
    }

    @TestCase
    func test_of_Hour_02(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: -1, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Hour must be in [0, 23].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_Hour_03(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 23, minute: 0, second: 0, nanosecond: 0)
        let day = time.hour
        @Assert(day, 23)
    }

    @TestCase
    func test_of_Hour_04(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 24, minute: 0, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Hour must be in [0, 23].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_Minute_01(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.minute
        @Assert(day, 0)
    }

    @TestCase
    func test_of_Minute_02(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: -1, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Minute must be in [0, 59].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_Minute_03(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 59, second: 0, nanosecond: 0)
        let day = time.minute
        @Assert(day, 59)
    }

    @TestCase
    func test_of_Minute_04(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 60, second: 0, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Minute must be in [0, 59].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_Second_01(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.second
        @Assert(day, 0)
    }

    @TestCase
    func test_of_Second_02(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: -1, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Second must be in [0, 59].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_Second_03(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 59, nanosecond: 0)
        let day = time.second
        @Assert(day, 59)
    }

    @TestCase
    func test_of_Second_04(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 60, nanosecond: 0)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Second must be in [0, 59].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_nanoSecond_01(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let day = time.nanosecond
        @Assert(day, 0)
    }

    @TestCase
    func test_of_nanoSecond_02(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: -1)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Nanosecond must be in [0, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_nanoSecond_03(): Unit {
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 999999999)
        let day = time.nanosecond
        @Assert(day, 999999999)
    }

    @TestCase
    func test_of_nanoSecond_04(): Unit {
        var flag: Bool = false
        try {
            let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0,
                nanosecond: 1000000000)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Nanosecond must be in [0, 999,999,999].")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_of_timeZone_01(): Unit {
        let zone = TimeZone("Asia/Shanghai", Duration.Zero)
        let time = DateTime.of(year: 2008, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0,
            timeZone: zone)
        @Assert(time.zone, zone)
        @Assert(time.zoneId, "Asia/Shanghai")
        @Assert(time.zoneOffset, Duration.Zero)
    }
}
