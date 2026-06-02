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
    @TestCase
    func checkInputForFormatParseForYear(): Unit {
        try {
            DateTime.parse("1-04-10", "y-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 1: \"-\" should be integer.")
        }
        try {
            DateTime.parse("111-04-10", "yyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 3: \"-\" should be integer.")
        }

        try {
            DateTime.parse("1111-04-10", "yy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 2: \"1\" should be \"-\".")
        }

        try {
            DateTime.parse("11111-04-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 4: \"1\" should be \"-\".")
        }

        try {
            DateTime.parse("04-10", "MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Lack of year value.")
        }

        try {
            DateTime.parse("999999999-04-10", "yyyyyyyyyy-MM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"y\" can not exceed 9.")
        }

        try {
            DateTime.parse("2023-2023-04-10", "yyyy-yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra year format.")
        }
    }

    @TestCase
    func checkInputForFormatParseForMonth(): Unit {
        try {
            DateTime.parse("2023-10", "yyyy-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Lack of month value.")
        }

        try {
            DateTime.parse("2023-04-10", "yyyy-MMMMM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"M\" can not exceed 4.")
        }

        try {
            DateTime.parse("2023-04-10", "yyyy-MMM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
        }

        try {
            DateTime.parse("2023-Apr-10", "yyyy-M-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 5: \"A\" should be integer.")
        }

        try {
            DateTime.parse("2023-13-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Month value must be in [1, 12].")
        }

        try {
            DateTime.parse("2023-1-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 6: \"-\" should be integer.")
        }

        try {
            DateTime.parse("2023-04-04-10", "yyyy-MM-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra month format.")
        }

        try {
            DateTime.parse("2023-10", "yyyy-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Lack of month value.")
        }
    }

    @TestCase
    func checkInputForFormatParseForDay(): Unit {
        try {
            DateTime.parse("2023-04", "yyyy-MM")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Lack of dayOfMonth value.")
        }

        try {
            DateTime.parse("2023-04-00", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of April in 2023 must be in [1, 30].")
        }

        try {
            DateTime.parse("2023-04-1", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 8: insufficient remaining length.")
        }

        try {
            DateTime.parse("2023-04-10", "yyyy-MM-ddd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"d\" can not exceed 2.")
        }

        try {
            DateTime.parse("2023-04-10-10", "yyyy-MM-dd-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra dayOfMonth format.")
        }

        try {
            DateTime.parse("2023-04-10-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 10.")
        }
    }

    @TestCase
    func checkInputForFormatParseForDayOfWeek(): Unit {
        try {
            DateTime.parse("2023-04-10-1", "yyyy-MM-dd-ww")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10-1", "yyyy-MM-dd-www")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
        }
        try {
            DateTime.parse("2023-04-10-Mon", "yyyy-MM-dd-wwww")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
        }
        try {
            DateTime.parse("2023-04-10-Monday", "yyyy-MM-dd-www")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 14.")
        }
        try { // Wrong day of week
            DateTime.parse("2023-04-10-Tue", "yyyy-MM-dd-www")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The day of week does not match.")
        }
        try {
            DateTime.parse("2023-04-10-1-1", "yyyy-MM-dd-w-w")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra dayOfWeek format.")
        }
        try {
            DateTime.parse("2023-04-10-1-1", "yyyy-MM-dd-wwwww")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"w\" can not exceed 4.")
        }
    }

    @TestCase
    func checkInputForFormatParseForDayOfYear(): Unit {
        try {
            DateTime.parse("2023-001", "yyyy-DDD")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"D\" can not exceed 2.")
        }
        try {
            DateTime.parse("2023-001-001", "yyyy-DD-DD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra dayOfYear format.")
        }
        try {
            DateTime.parse("2023-0", "yyyy-D")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of year can not be equal to 0.")
        }
        try {
            DateTime.parse("2023-05-04T100", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Month value does not match dayOfYear.")
        }
        try {
            DateTime.parse("2023-05-04T122", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "DayOfMonth value does not match dayOfYear.")
        }
        try {
            DateTime.parse("2023-05-04T", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "No dayOfYear value to match.")
        }
        try {
            DateTime.parse("2023-05-04Ta", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: dayOfYear value should be integer.")
        }
        try {
            DateTime.parse("2023-05-04T-100", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: dayOfYear value should be integer.")
        }
        try {
            DateTime.parse("2023-366", "yyyy-DD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "DayOfYear value in 2023 must be in [1, 365].")
        }
    }

    @TestCase
    func checkInputForFormatParseForhour_h(): Unit {
        try {
            DateTime.parse("2023-04-10T13", "yyyy-MM-ddThh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Hour value in format \"hh\" must be in [1, 12].")
        }

        try {
            DateTime.parse("2023/04/17 00:00:00 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Hour value in format \"hh\" must be in [1, 12].")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddThh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddThhh")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"h\" can not exceed 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddThh-hh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra hour format.")
        }
        try {
            DateTime.parse("2023-04-10T-2", "yyyy-MM-ddTh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
        }
    }

    @TestCase
    func checkInputForFormatParseForhour_H(): Unit {
        try {
            DateTime.parse("2023-04-10T25", "yyyy-MM-ddTHH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Hour value in format \"HH\" must be in [0, 23].")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTHH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTHHH")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"H\" can not exceed 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddTHH-HH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra hour format.")
        }
        try {
            DateTime.parse("2023-04-10T-2", "yyyy-MM-ddTH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
        }
    }

    @TestCase
    func checkInputForFormatParseForMinute(): Unit {
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTmm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Minute value must be in [0, 59].")
        }
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Minute value must be in [0, 59].")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTmm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTmmm")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"m\" can not exceed 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddTmm-mm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra minute format.")
        }
    }

    @TestCase
    func checkInputForFormatParseForSecond(): Unit {
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTss")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Second value must be in [0, 59].")
        }
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTs")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Second value must be in [0, 59].")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTss")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTsss")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"s\" can not exceed 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddTss-ss")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra second format.")
        }
    }

    @TestCase
    func checkInputForFormatParseForNanosecond(): Unit {
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T-123", "yyyy-MM-ddTS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
        }
        try {
            DateTime.parse("2023-04-10T1234", "yyyy-MM-ddTSS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T1234567", "yyyy-MM-ddTSSS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T123456789", "yyyy-MM-ddTSSSS")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"S\" can not exceed 3.")
        }
        try {
            DateTime.parse("2023-04-10T123-123", "yyyy-MM-ddTS-S")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra nanosecond format.")
        }
    }
    @TestCase
    func checkInputForFormatParseForZone_1(): Unit {
        try {
            DateTime.parse("2023-04-10 +8", "yyyy-MM-dd O")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +08", "yyyy-MM-dd OO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +08:00", "yyyy-MM-dd OOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +08:-00", "yyyy-MM-dd OOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 Z", "yyyy-MM-dd O")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +26:00:00", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The hour in offset should be in [-24, 25].")
        }
        try {
            DateTime.parse("2023-04-10 -25:00:00", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The hour in offset should be in [-24, 25].")
        }
        try {
            DateTime.parse("2023-04-10 +23:60:00", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The minute or second in offset should be in [0, 59].")
        }
        try {
            DateTime.parse("2023-04-10 +23:30:60", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The minute or second in offset should be in [0, 59].")
        }
        try {
            DateTime.parse("2023-04-10 Z", "yyyy-MM-dd OOOOO")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"O\" can not exceed 4.")
        }
        try {
            DateTime.parse("2023-04-10 Z GMT+00:00", "yyyy-MM-dd OOOO ZZZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra zone offset format.")
        }
        try {
            DateTime.parse("+08:00:0:0", "OOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 8: \":\" should be integer.")
        }
    }

    @TestCase
    func checkInputForFormatParseForZone_2(): Unit {
        try {
            DateTime.parse("2023-04-10 Asia//Shanghai", "yyyy-MM-dd zzzz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 16.")
        }
        try {
            DateTime.parse("2023-04-10 Asia\\Shanghai", "yyyy-MM-dd zzzz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message.contains("Illegal zone name or zone id.") || e.message.contains("Extar value"), true)
        }
        try {
            DateTime.parse("2023-04-10 XXT", "yyyy-MM-dd zz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone name or zone id.")
        }
        try { // cannot load: exist but not in usr/share/zoneinfo
            DateTime.parse("2023-04-10 ACWST", "yyyy-MM-dd zz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone name or zone id.")
        }
        try {
            DateTime.parse("2023-04-10 CST", "yyyy-MM-dd zzzzz")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"z\" can not exceed 4.")
        }
        try {
            DateTime.parse("2023-04-25 CST CST", "yyyy-MM-dd z z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra zone id format.")
        }
        try {
            DateTime.parse("2023-05-04T Asia/Shanghai +09:00", "yyyy-MM-ddT zzzz OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The zone offset does not match.")
        }
    }

    @TestCase
    func checkInputForFormatParseForZone_3(): Unit {
        try {
            DateTime.parse("2023-04-10 GMT+08:00", "yyyy-MM-dd Z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 17.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+08:00:00", "yyyy-MM-dd ZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 20.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+8", "yyyy-MM-dd ZZZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+8", "yyyy-MM-dd ZZZZZ")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"Z\" can not exceed 4.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+00:00 Z", "yyyy-MM-dd ZZZZ OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra zone offset format.")
        }
        try {
            DateTime.parse("a", "Z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 GMT08:00:00", "yyyy-MM-dd ZZZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Zone offset should start with \"+\" or \"-\".")
        }
        try {
            DateTime.parse("2023-04-10 GMT08", "yyyy-MM-dd Z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Zone offset should start with \"+\" or \"-\".")
        }
    }

    @TestCase
    func checkInputForFormatParseForEra(): Unit {
        try {
            DateTime.parse("2023 A 04-10", "yyyy GGGG MM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"G\" can not exceed 3.")
        }
        try {
            DateTime.parse("2023 A 04-10", "yyyy GG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal era value.")
        }
        try {
            DateTime.parse("2023 AD 04-10", "yyyy GGG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal era value.")
        }
        try {
            DateTime.parse("2023 B 04-10", "yyyy G MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal era value.")
        }
        try {
            DateTime.parse("2023 BD 04-10", "yyyy GG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal era value.")
        }
        try {
            DateTime.parse("2023 Bnno Domini 04-10", "yyyy GGG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal era value.")
        }
        try {
            DateTime.parse("2023 A A 04-10", "yyyy G G MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra era value.")
        }
    }

    @TestCase
    func checkInputForFormatParseForApm(): Unit {
        try { // n > 1
            DateTime.parse("2023 04-10 01 AM", "yyyy MM-dd hh aa")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"a\" can not exceed 1.")
        }
        try { // hour(1) in 24h but use PM
            DateTime.parse("2023 04-10 01 PM", "yyyy MM-dd HH a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The time is not in the afternoon.")
        }
        try { // hour(13) in 24h but use AM
            DateTime.parse("2023 04-10 13 AM", "yyyy MM-dd HH a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The time is not in the morning.")
        }
        try {
            DateTime.parse("2023 04-10 01 A", "yyyy MM-dd HH a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal AM/PM value.")
        }
        try {
            DateTime.parse("2023 04-10 01 AM AM", "yyyy MM-dd HH a a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra AM/PM value.")
        }
        try {
            DateTime.parse("2023-04-25 AP", "yyyy-MM-dd a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal AM/PM value.")
        }
    }

    @TestCase
    func checkInputForFormatParseForIsoYear(): Unit {
        try {
            DateTime.parse("1-04-10", "Y-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 1: \"-\" should be integer.")
        }
        try {
            DateTime.parse("111-04-10", "YYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 3: \"-\" should be integer.")
        }
        try {
            DateTime.parse("1111-04-10", "YYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Lack of year value.")
        }
        try {
            DateTime.parse("11111-04-10", "YYYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 4: \"1\" should be \"-\".")
        }
        try {
            DateTime.parse("999999999-04-10", "YYYYYYYYYY-MM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"Y\" can not exceed 9.")
        }
        try {
            DateTime.parse("2023-2023-04-10", "YYYY-YYYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra year format.")
        }
        try { // ISOYear of 2023-01-01 is 2022
            DateTime.parse("2023-2023-01-01", "yyyy-YYYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The year based on ISO8601 does not match.")
        }
    }

    @TestCase
    func checkInputForFormatParseForIsoWeek(): Unit {
        try { // n > 2
            DateTime.parse("2023-01-04T001", "yyyy-MM-ddTWWW")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of character \"W\" can not exceed 2.")
        }
        try { // dayofweek value does not match
            DateTime.parse("2023-01-04T2", "yyyy-MM-ddTW")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "The week based on ISO8601 does not match.")
        }
        try {
            DateTime.parse("2023-01-01T52-52", "yyyy-MM-ddTWW-WW")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra isoWeek format.")
        }
        try {
            DateTime.parse("2023-01-04T-2", "yyyy-MM-ddTW")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
        }
        @Expect(1, 1)
    }

    @TestCase
    func checkInputForFormatParseForExtra(): Unit {
        try {
            DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "No value to match \" \".")
        }
    }
}
