/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows) DEPENDENCE: ../../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Windows) RUN-EXEC-PIPE: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args
// (Unix)EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.time.*

@Test
public class ToStringTest {
    @TestCase
    func toStringForTotal(): Unit {
        var dateTime = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
        @Expect(dateTime.toString(), "2023-04-10T00:00:00Z")
        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime.toString(), "2023-04-10T00:00:00+08:00")
        dateTime = DateTime.ofUTC(year: 99999, month: 4, dayOfMonth: 10)
        @Expect(dateTime.toString(), "99999-04-10T00:00:00Z")

        dateTime = DateTime.parse("2023-04-10T00:00:00+08:00")
        var string = dateTime.toString()
        @Expect(DateTime.parse(string).toString(), string)

        dateTime = DateTime.parse("2023-04-10T00:00:00+08:00:01")
        string = dateTime.toString()
        @Expect(DateTime.parse(string).toString(), string)

        dateTime = DateTime.parse("Wed, 23 Nov 2011 01:05:03 GMT", DateTimeFormat.RFC1123)
        string = dateTime.format(DateTimeFormat.RFC1123)
        @Expect(string, "Wed, 23 Nov 2011 01:05:03 GMT")
    }

    @TestCase
    func toStringForYear(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("y"), "2023")
        @Expect(dateTime.format("yy"), "23")
        @Expect(dateTime.format("yyy"), "2023")
        @Expect(dateTime.format("yyyy"), "2023")
        @Expect(dateTime.format("yyyyy"), "02023")

        dateTime = DateTime.of(year: 1969, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("yy"), "69")
        dateTime = DateTime.of(year: 23, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("yy"), "0023")
    }

    @TestCase
    func toStringForYear_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 9
            dateTime.format("yyyyyyyyyy")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"y\" can not exceed 9.")
        }
    }

    @TestCase
    func toStringForMonth(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("M"), "4")
        @Expect(dateTime.format("MM"), "04")
        @Expect(dateTime.format("MMM"), "Apr")
        @Expect(dateTime.format("MMMM"), "April")
    }

    @TestCase
    func toStringForMonth_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 4
            dateTime.format("MMMMM")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"M\" can not exceed 4.")
        }
    }

    @TestCase
    func toStringForDay(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 9)
        @Expect(dateTime.format("d"), "9")
        @Expect(dateTime.format("dd"), "09")
    }

    @TestCase
    func toStringForDay_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 2
            dateTime.format("ddd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"d\" can not exceed 2.")
        }
    }

    @TestCase
    func toStringForHour(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("h"), "12")
        @Expect(dateTime.format("hh"), "12")
        @Expect(dateTime.format("H"), "0")
        @Expect(dateTime.format("HH"), "00")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, hour: 12)
        @Expect(dateTime.format("h"), "12")
        @Expect(dateTime.format("hh"), "12")
        @Expect(dateTime.format("H"), "12")
        @Expect(dateTime.format("HH"), "12")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, hour: 13)
        @Expect(dateTime.format("h"), "1")
        @Expect(dateTime.format("hh"), "01")
        @Expect(dateTime.format("H"), "13")
        @Expect(dateTime.format("HH"), "13")
    }

    @TestCase
    func toStringForHour_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 2
            dateTime.format("hhh")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"h\" can not exceed 2.")
        }
        try { // n > 2
            dateTime.format("HHH")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"H\" can not exceed 2.")
        }
    }

    @TestCase
    func toStringForMinute(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("m"), "0")
        @Expect(dateTime.format("mm"), "00")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, minute: 5)
        @Expect(dateTime.format("m"), "5")
        @Expect(dateTime.format("mm"), "05")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, minute: 30)
        @Expect(dateTime.format("m"), "30")
        @Expect(dateTime.format("mm"), "30")
    }

    @TestCase
    func toStringForMinute_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 2
            dateTime.format("mmm")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"m\" can not exceed 2.")
        }
    }

    @TestCase
    func toStringForSecond(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("s"), "0")
        @Expect(dateTime.format("ss"), "00")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, second: 5)
        @Expect(dateTime.format("s"), "5")
        @Expect(dateTime.format("ss"), "05")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, second: 30)
        @Expect(dateTime.format("s"), "30")
        @Expect(dateTime.format("ss"), "30")
    }

    @TestCase
    func toStringForSecond_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 2
            dateTime.format("sss")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"s\" can not exceed 2.")
        }
    }

    @TestCase
    func toStringForNanosecond(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("S"), "000")
        @Expect(dateTime.format("SS"), "000000")
        @Expect(dateTime.format("SSS"), "000000000")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, second: 30, nanosecond: 1234)
        @Expect(dateTime.format("S"), "000")
        @Expect(dateTime.format("SS"), "000001")
        @Expect(dateTime.format("SSS"), "000001234")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, second: 30, nanosecond: 123456789)
        @Expect(dateTime.format("S"), "123")
        @Expect(dateTime.format("SS"), "123456")
        @Expect(dateTime.format("SSS"), "123456789")
    }

    @TestCase
    func toStringForNanosecond_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 3
            dateTime.format("SSSS")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"S\" can not exceed 3.")
        }
    }

    @TestCase
    func toStringForZone(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime.format("z"), "CST")
        @Expect(dateTime.format("zz"), "CST")
        @Expect(dateTime.format("zzz"), "CST")
        @Expect(dateTime.format("zzzz"), "Asia/Shanghai")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, second: 30, timeZone: TimeZone.UTC)
        @Expect(dateTime.format("z"), "UTC")
        @Expect(dateTime.format("zz"), "UTC")
        @Expect(dateTime.format("zzz"), "UTC")
        @Expect(dateTime.format("zzzz"), "UTC")
    }

    @TestCase
    func toStringForZone_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 5
            dateTime.format("zzzzz")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"z\" can not exceed 4.")
        }
    }

    @TestCase
    func toStringForZoneOffset(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime.format("O"), "+08")
        @Expect(dateTime.format("OO"), "+08:00")
        @Expect(dateTime.format("OOO"), "+08:00:00")
        @Expect(dateTime.format("OOOO"), "+08:00")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, second: 30, timeZone: TimeZone.UTC)
        @Expect(dateTime.format("O"), "+00")
        @Expect(dateTime.format("OO"), "+00:00")
        @Expect(dateTime.format("OOO"), "+00:00:00")
        @Expect(dateTime.format("OOOO"), "Z")
    }

    @TestCase
    func toStringForZoneOffset_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 5
            dateTime.format("OOOOO")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"O\" can not exceed 4.")
        }
    }

    @TestCase
    func toStringForGMTOffset(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, timeZone: TimeZone.load("Asia/Shanghai"))
        @Expect(dateTime.format("Z"), "GMT+8")
        @Expect(dateTime.format("ZZ"), "GMT+08:00")
        @Expect(dateTime.format("ZZZ"), "GMT+08:00:00")
        @Expect(dateTime.format("ZZZZ"), "GMT+08:00")

        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12, second: 30, timeZone: TimeZone.UTC)
        @Expect(dateTime.format("Z"), "GMT+0")
        @Expect(dateTime.format("ZZ"), "GMT+00:00")
        @Expect(dateTime.format("ZZZ"), "GMT+00:00:00")
        @Expect(dateTime.format("ZZZZ"), "GMT+00:00")
    }

    @TestCase
    func toStringForGMTOffset_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 4
            dateTime.format("ZZZZZ")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"Z\" can not exceed 4.")
        }
    }

    @TestCase
    func toStringForDayOfWeek(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("w"), "3")
        @Expect(dateTime.format("ww"), "03")
        @Expect(dateTime.format("www"), "Wed")
        @Expect(dateTime.format("wwww"), "Wednesday")
    }

    @TestCase
    func toStringForDayOfWeek_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 4
            dateTime.format("wwwww")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"w\" can not exceed 4.")
        }
    }

    @TestCase
    func toStringFordayOfYear(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 1, dayOfMonth: 1)
        @Expect(dateTime.format("D"), "1")
        @Expect(dateTime.format("DD"), "001")
        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 9)
        @Expect(dateTime.format("D"), "99")
        @Expect(dateTime.format("DD"), "099")
        dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 10)
        @Expect(dateTime.format("D"), "100")
        @Expect(dateTime.format("DD"), "100")
    }

    @TestCase
    func toStringFordayOfYear_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 2
            dateTime.format("DDD")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"D\" can not exceed 2.")
        }
    }

    @TestCase
    func toStringForEra(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        @Expect(dateTime.format("G"), "A")
        @Expect(dateTime.format("GG"), "AD")
        @Expect(dateTime.format("GGG"), "Anno Domini")
    }

    @TestCase
    func ctoStringForEra_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 4, dayOfMonth: 12)
        try { // n > 3
            dateTime.format("GGGG")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"G\" can not exceed 3.")
        }
    }

    @TestCase
    func toStringForIsoyear(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 1, dayOfMonth: 1)
        @Expect(dateTime.format("Y"), "2022")
        @Expect(dateTime.format("YY"), "22")
        @Expect(dateTime.format("YYYY"), "2022")
        @Expect(dateTime.format("YYYY"), "2022")
        @Expect(dateTime.format("YYYYY"), "02022")
    }

    @TestCase
    func toStringForIsoyear_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 1, dayOfMonth: 1)
        try { // n > 9
            dateTime.format("YYYYYYYYYY")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"Y\" can not exceed 9.")
        }
    }

    @TestCase
    func toStringForIsoweek(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 1, dayOfMonth: 4)
        @Expect(dateTime.format("W"), "1")
        @Expect(dateTime.format("WW"), "01")
    }

    @TestCase
    func toStringForIsoweek_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 1, dayOfMonth: 4)
        try { // n > 2
            dateTime.format("WWW")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"W\" can not exceed 2.")
        }
    }

    @TestCase
    func toStringForApm(): Unit {
        var dateTime = DateTime.of(year: 2023, month: 12, dayOfMonth: 4, hour: 11)
        @Expect(dateTime.format("a"), "AM")
        dateTime = DateTime.of(year: 2023, month: 1, dayOfMonth: 4, hour: 12)
        @Expect(dateTime.format("a"), "PM")
    }

    @TestCase
    func toStringForApm_exception(): Unit {
        let dateTime = DateTime.of(year: 2023, month: 1, dayOfMonth: 4)
        try { // n > 1
            dateTime.format("aa")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"a\" can not exceed 1.")
        }
    }
}
