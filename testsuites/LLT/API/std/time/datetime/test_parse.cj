/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args
// (Windows) RUN-EXEC-PIPE-0: cmake -E env CJ_TZPATH=%pwd\zoneinfo\ %run %run_opt %output %run_utest_opt %run_args

import std.time.*

@Test
public class DateTimeParseTest {
    @TestCase[timeStr in [ "2023-04-12T20:17:30+08:00", "2023-04-02T00:00:00-08:00:01", "-2020-02-29T00:00:00Z" ] 
]
    func datetimeParse(timeStr: String): Unit {
        var dateTime = DateTime.parse(timeStr)
        @Expect(dateTime.toString(), timeStr)
    }

    @TestCase
    func datetimeParseWithSecondFraction(): Unit {
        var dateTime = DateTime.parse("2023-04-12T20:17:30.123456789+08:00")
        @Expect(dateTime.toString(), "2023-04-12T20:17:30.123456789+08:00")
        dateTime = DateTime.parse("2023-04-02T00:00:00.123000000-08:00:01")
        @Expect(dateTime.toString(), "2023-04-02T00:00:00.123-08:00:01")
        dateTime = DateTime.parse("-2020-02-29T00:00:00.1Z")
        @Expect(dateTime.toString(), "-2020-02-29T00:00:00.1Z")
    }

    @TestCase
    func datetimeParseforYear(): Unit {
        var dateTime = DateTime.parse("2023-04-10", "yyyy-MM-dd")
        @Expect(dateTime.format("yyyy"), "2023")

        dateTime = DateTime.parse("2023-04-10", "y-MM-dd")
        @Expect(dateTime.format("yyyy"), "2023")

        dateTime = DateTime.parse("2023-04-10", "yyy-MM-dd")
        @Expect(dateTime.format("yyyy"), "2023")

        dateTime = DateTime.parse("23-04-10", "yy-MM-dd")
        @Expect(dateTime.format("yyyy"), "2023")

        dateTime = DateTime.parse("69-04-10", "yy-MM-dd")
        @Expect(dateTime.format("yyyy"), "1969")

        dateTime = DateTime.parse("11111-04-10", "yyyyy-MM-dd")
        @Expect(dateTime.format("yyyy"), "11111")
    }

    @TestCase
    func datetimeParseforMonth(): Unit {
        var dateTime = DateTime.parse("2023-04-10", "yyyy-MM-dd")
        @Expect(dateTime.format("MM"), "04")

        dateTime = DateTime.parse("2023-04-10", "yyyy-M-dd")
        @Expect(dateTime.format("MM"), "04")

        dateTime = DateTime.parse("2023-4-10", "yyyy-M-dd")
        @Expect(dateTime.format("MM"), "04")

        dateTime = DateTime.parse("2023-Apr-10", "yyyy-MMM-dd")
        @Expect(dateTime.format("MM"), "04")

        dateTime = DateTime.parse("2023-April-10", "yyyy-MMMM-dd")
        @Expect(dateTime.format("MM"), "04")
    }

    @TestCase
    func datetimeParseforDay(): Unit {
        var dateTime = DateTime.parse("2023-04-10", "yyyy-MM-dd")
        @Expect(dateTime.format("dd"), "10")

        dateTime = DateTime.parse("2023-04-10", "yyyy-MM-d")
        @Expect(dateTime.format("dd"), "10")

        dateTime = DateTime.parse("2023-04-1", "yyyy-MM-d")
        @Expect(dateTime.format("dd"), "01")
    }

    @TestCase
    func datetimeParseforHour_h(): Unit {
        var dateTime = DateTime.parse("2023-04-10T10", "yyyy-MM-ddThh")
        @Expect(dateTime.format("HH"), "10")

        dateTime = DateTime.parse("2023-04-10T2", "yyyy-MM-ddTh")
        @Expect(dateTime.format("HH"), "02")

        dateTime = DateTime.parse("2023-04-10T10", "yyyy-MM-ddTh")
        @Expect(dateTime.format("HH"), "10")

        dateTime = DateTime.parse("2023-04-10T01", "yyyy-MM-ddTh")
        @Expect(dateTime.format("HH"), "01")
    }

    @TestCase
    func datetimeParseforHour_H(): Unit {
        var dateTime = DateTime.parse("2023-04-10T23", "yyyy-MM-ddTHH")
        @Expect(dateTime.format("HH"), "23")

        dateTime = DateTime.parse("2023-04-10T23", "yyyy-MM-ddTH")
        @Expect(dateTime.format("HH"), "23")

        dateTime = DateTime.parse("2023-04-10T2", "yyyy-MM-ddTH")
        @Expect(dateTime.format("HH"), "02")

        dateTime = DateTime.parse("2023-04-10T02", "yyyy-MM-ddTH")
        @Expect(dateTime.format("HH"), "02")
    }

    @TestCase
    func datetimeParseforMinute(): Unit {
        var dateTime = DateTime.parse("2023-04-10T01", "yyyy-MM-ddTmm")
        @Expect(dateTime.format("mm"), "01")

        dateTime = DateTime.parse("2023-04-10T1", "yyyy-MM-ddTm")
        @Expect(dateTime.format("mm"), "01")

        dateTime = DateTime.parse("2023-04-10T01", "yyyy-MM-ddTm")
        @Expect(dateTime.format("mm"), "01")
    }

    @TestCase
    func datetimeParseforSecond(): Unit {
        var dateTime = DateTime.parse("2023-04-10T01", "yyyy-MM-ddTss")
        @Expect(dateTime.format("ss"), "01")

        dateTime = DateTime.parse("2023-04-10T1", "yyyy-MM-ddTs")
        @Expect(dateTime.format("ss"), "01")

        dateTime = DateTime.parse("2023-04-10T01", "yyyy-MM-ddTs")
        @Expect(dateTime.format("ss"), "01")
    }

    @TestCase
    func datetimeParseforNanosecond(): Unit {
        var dateTime = DateTime.parse("2023-04-10T123", "yyyy-MM-ddTS")
        @Expect(dateTime.format("SSS"), "123000000")

        dateTime = DateTime.parse("2023-04-10T123456", "yyyy-MM-ddTSS")
        @Expect(dateTime.format("SSS"), "123456000")

        dateTime = DateTime.parse("2023-04-10T123456789", "yyyy-MM-ddTSSS")
        @Expect(dateTime.format("SSS"), "123456789")
    }

    @TestCase
    func datetimeParseforZone_1(): Unit {
        var dateTime = DateTime.parse("2023-04-10 -08", "yyyy-MM-dd O")
        @Expect(dateTime.format("O"), "-08")

        dateTime = DateTime.parse("2023-04-10 +08:00", "yyyy-MM-dd OO")
        @Expect(dateTime.format("OO"), "+08:00")

        dateTime = DateTime.parse("2023-04-10 +08:00:00", "yyyy-MM-dd OOO")
        @Expect(dateTime.format("OOO"), "+08:00:00")

        dateTime = DateTime.parse("2023-04-10 +08:01", "yyyy-MM-dd OOOO")
        @Expect(dateTime.format("OOOO"), "+08:01")

        dateTime = DateTime.parse("2023-04-10 +25:59:59", "yyyy-MM-dd OOOO")
        @Expect(dateTime.format("OOOO"), "+25:59:59")

        dateTime = DateTime.parse("2023-04-10 -24:59:59", "yyyy-MM-dd OOOO")
        @Expect(dateTime.format("OOOO"), "-24:59:59")

        dateTime = DateTime.parse("2023-04-10 Z", "yyyy-MM-dd OOOO")
        @Expect(dateTime.format("O"), "+00")
        @Expect(dateTime.format("OO"), "+00:00")
        @Expect(dateTime.format("OOO"), "+00:00:00")
        @Expect(dateTime.format("OOOO"), "Z")
    }

    @TestCase
    func datetimeParseforZone_2(): Unit {
        var dateTime = DateTime.parse("2023-04-10 Asia/Shanghai", "yyyy-MM-dd zzzz")
        @Expect(dateTime.format("zzzz"), "Asia/Shanghai")

        dateTime = DateTime.parse("2023-04-10 UTC", "yyyy-MM-dd z")
        @Expect(dateTime.format("z"), "UTC")

        dateTime = DateTime.parse("2023-04-10 UTC", "yyyy-MM-dd zz")
        @Expect(dateTime.format("zz"), "UTC")

        dateTime = DateTime.parse("2023-04-10 UTC", "yyyy-MM-dd zzz")
        @Expect(dateTime.format("zzz"), "UTC")
    }

    @TestCase
    func datetimeParseforZone_3(): Unit {
        var dateTime = DateTime.parse("2023-04-10 GMT+0", "yyyy-MM-dd Z")
        @Expect(dateTime.format("Z"), "GMT+0")

        dateTime = DateTime.parse("2023-04-10 GMT+08:00", "yyyy-MM-dd ZZ")
        @Expect(dateTime.format("ZZ"), "GMT+08:00")

        dateTime = DateTime.parse("2023-04-10 GMT+08:00:00", "yyyy-MM-dd ZZZ")
        @Expect(dateTime.format("ZZZ"), "GMT+08:00:00")

        dateTime = DateTime.parse("2023-04-10 GMT+08:00", "yyyy-MM-dd ZZZZ")
        @Expect(dateTime.format("ZZZZ"), "GMT+08:00")

        dateTime = DateTime.parse("2023-04-10 GMT-08:00:01", "yyyy-MM-dd ZZZZ")
        @Expect(dateTime.format("ZZZZ"), "GMT-08:00:01")

        dateTime = DateTime.parse("2023-04-10 GMT+12", "yyyy-MM-dd Z")
        @Expect(dateTime.format("ZZZZ"), "GMT+12:00")

        dateTime = DateTime.parse("2023-04-10 GMT+1 AM", "yyyy-MM-dd Z a")
        @Expect(dateTime.format("Z"), "GMT+1")

        dateTime = DateTime.parse("2023-04-10 GMT-8", "yyyy-MM-dd Z")
        @Expect(dateTime.format("Z"), "GMT-8")
    }

    @TestCase
    func datetimeParseforDayOfWeek(): Unit {
        DateTime.parse("2023-04-10-1", "yyyy-MM-dd-w")
        DateTime.parse("2023-04-10-01", "yyyy-MM-dd-ww")
        DateTime.parse("2023-04-10-Mon", "yyyy-MM-dd-www")
        DateTime.parse("2023-04-10-Monday", "yyyy-MM-dd-wwww")
        DateTime.parse("2023-04-10-01", "yyyy-MM-dd-w")
    }

    @TestCase
    func datetimeParseforDayOfYear(): Unit {
        var dateTime = DateTime.parse("2023-2", "yyyy-D")
        @Expect(dateTime.monthValue, 1)
        @Expect(dateTime.dayOfMonth, 2)
        DateTime.parse("2023-1", "yyyy-DD")
        DateTime.parse("2023-01", "yyyy-D")
        DateTime.parse("2023-01", "yyyy-DD")
        DateTime.parse("2023-001", "yyyy-D")
        DateTime.parse("2023-001", "yyyy-DD")
        DateTime.parse("2023-1AM", "yyyy-DDa")
    }

    @TestCase
    func datetimeParseforEra(): Unit {
        DateTime.parse("2023 A 04-10", "yyyy G MM-dd")
        DateTime.parse("2023 AD 04-10", "yyyy GG MM-dd")
        DateTime.parse("2023 Anno Domini 04-10", "yyyy GGG MM-dd")
    }

    @TestCase
    func datetimeParseforApm(): Unit {
        var dateTime = DateTime.parse("2023 04-10 01 AM", "yyyy MM-dd hh a")
        @Expect(dateTime.hour, 1)
        dateTime = DateTime.parse("2023 04-10 01 PM", "yyyy MM-dd hh a")
        @Expect(dateTime.hour, 13)
        dateTime = DateTime.parse("2023 04-10 01 AM", "yyyy MM-dd HH a")
        @Expect(dateTime.hour, 1)
        dateTime = DateTime.parse("2023 04-10 13 PM", "yyyy MM-dd HH a")
        @Expect(dateTime.hour, 13)
        dateTime = DateTime.parse("2023 04-10 12 PM", "yyyy MM-dd hh a")
        @Expect(dateTime.hour, 12)
        dateTime = DateTime.parse("2023 04-10 12 AM", "yyyy MM-dd hh a")
        @Expect(dateTime.hour, 0)
    }

    @TestCase
    func datetimeParseforIsoyear(): Unit {
        var dateTime = DateTime.parse("2023-04-10-2023", "yyyy-MM-dd-YYYY")
        @Expect(dateTime.format("YYYY"), "2023")
        dateTime = DateTime.parse("2023-04-10-2023", "yyyy-MM-dd-Y")
        @Expect(dateTime.format("YYYY"), "2023")
        dateTime = DateTime.parse("2023-04-10-2023", "yyyy-MM-dd-YYY")
        @Expect(dateTime.format("YYYY"), "2023")
        dateTime = DateTime.parse("2023-04-10-23", "yyyy-MM-dd-YY")
        @Expect(dateTime.format("YYYY"), "2023")
    }

    @TestCase
    func datetimeParseforIsoweek(): Unit {
        var dateTime = DateTime.parse("2023-01-04T1", "yyyy-MM-ddTW")
        @Expect(dateTime.format("W"), "1")
        @Expect(dateTime.format("WW"), "01")
        dateTime = DateTime.parse("2023-01-04T01", "yyyy-MM-ddTWW")
        @Expect(dateTime.format("WW"), "01")
        dateTime = DateTime.parse("2023-01-01T52", "yyyy-MM-ddTW")
        @Expect(dateTime.format("W"), "52")
        dateTime = DateTime.parse("2023-01-01T52", "yyyy-MM-ddTWW")
        @Expect(dateTime.format("WW"), "52")
    }
}
