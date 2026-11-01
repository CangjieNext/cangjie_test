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
            @Expect(e.message, "Failed to parse at index 1: expected an integer, got '-'.")
        }
        try {
            DateTime.parse("111-04-10", "yyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 3: expected an integer, got '-'.")
        }

        try {
            DateTime.parse("1111-04-10", "yy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 2: expected '-', got '1'.")
        }

        try {
            DateTime.parse("11111-04-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 4: expected '-', got '1'.")
        }

        try {
            DateTime.parse("04-10", "MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Missing year value.")
        }

        try {
            DateTime.parse("999999999-04-10", "yyyyyyyyyy-MM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'y' exceeds maximum length 9.")
        }

        try {
            DateTime.parse("2023-2023-04-10", "yyyy-yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate year format.")
        }
    }

    @TestCase
    func checkInputForFormatParseForMonth(): Unit {
        try {
            DateTime.parse("2023-10", "yyyy-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Missing month value.")
        }

        try {
            DateTime.parse("2023-04-10", "yyyy-MMMMM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'M' exceeds maximum length 4.")
        }

        try {
            DateTime.parse("2023-04-10", "yyyy-MMM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse day of week or month.")
        }

        try {
            DateTime.parse("2023-Apr-10", "yyyy-M-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 5: expected an integer, got 'A'.")
        }

        try {
            DateTime.parse("2023-13-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid month value: expected 1 to 12.")
        }

        try {
            DateTime.parse("2023-1-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 6: expected an integer, got '-'.")
        }

        try {
            DateTime.parse("2023-04-04-10", "yyyy-MM-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate month format.")
        }

        try {
            DateTime.parse("2023-10", "yyyy-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Missing month value.")
        }
    }

    @TestCase
    func checkInputForFormatParseForDay(): Unit {
        try {
            DateTime.parse("2023-04", "yyyy-MM")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Missing day of month value.")
        }

        try {
            DateTime.parse("2023-04-00", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day '0' for April 2023: expected 1 to 30.")
        }

        try {
            DateTime.parse("2023-04-1", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 8: insufficient remaining length.")
        }

        try {
            DateTime.parse("2023-04-10", "yyyy-MM-ddd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'd' exceeds maximum length 2.")
        }

        try {
            DateTime.parse("2023-04-10-10", "yyyy-MM-dd-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate day of month format.")
        }

        try {
            DateTime.parse("2023-04-10-10", "yyyy-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra value starting at index 10.")
        }
    }

    @TestCase
    func checkInputForFormatParseForDayOfWeek(): Unit {
        try {
            DateTime.parse("2023-04-10-1", "yyyy-MM-dd-ww")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10-1", "yyyy-MM-dd-www")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse day of week or month.")
        }
        try {
            DateTime.parse("2023-04-10-Mon", "yyyy-MM-dd-wwww")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse day of week or month.")
        }
        try {
            DateTime.parse("2023-04-10-Monday", "yyyy-MM-dd-www")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra value starting at index 14.")
        }
        try { // Wrong day of week
            DateTime.parse("2023-04-10-Tue", "yyyy-MM-dd-www")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of week does not match.")
        }
        try {
            DateTime.parse("2023-04-10-1-1", "yyyy-MM-dd-w-w")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate day of week format.")
        }
        try {
            DateTime.parse("2023-04-10-1-1", "yyyy-MM-dd-wwwww")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'w' exceeds maximum length 4.")
        }
    }

    @TestCase
    func checkInputForFormatParseForDayOfYear(): Unit {
        try {
            DateTime.parse("2023-001", "yyyy-DDD")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'D' exceeds maximum length 2.")
        }
        try {
            DateTime.parse("2023-001-001", "yyyy-DD-DD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate day of year format.")
        }
        try {
            DateTime.parse("2023-0", "yyyy-D")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of year cannot be zero.")
        }
        try {
            DateTime.parse("2023-05-04T100", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Month and day of year are inconsistent.")
        }
        try {
            DateTime.parse("2023-05-04T122", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of month and day of year are inconsistent.")
        }
        try {
            DateTime.parse("2023-05-04T", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "No day of year value to match.")
        }
        try {
            DateTime.parse("2023-05-04Ta", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: day of year must be an integer.")
        }
        try {
            DateTime.parse("2023-05-04T-100", "yyyy-MM-ddTDD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: day of year must be an integer.")
        }
        try {
            DateTime.parse("2023-366", "yyyy-DD")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day of year '366' for 2023: expected 1 to 365.")
        }
    }

    @TestCase
    func checkInputForFormatParseForhour_h(): Unit {
        try {
            DateTime.parse("2023-04-10T13", "yyyy-MM-ddThh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in 'hh' format: expected 1 to 12.")
        }

        try {
            DateTime.parse("2023/04/17 00:00:00 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in 'hh' format: expected 1 to 12.")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddThh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddThhh")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'h' exceeds maximum length 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddThh-hh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate hour format.")
        }
        try {
            DateTime.parse("2023-04-10T-2", "yyyy-MM-ddTh")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: expected an integer, got '-'.")
        }
    }

    @TestCase
    func checkInputForFormatParseForhour_H(): Unit {
        try {
            DateTime.parse("2023-04-10T25", "yyyy-MM-ddTHH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in 'HH' format: expected 0 to 23.")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTHH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }

        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTHHH")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'H' exceeds maximum length 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddTHH-HH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate hour format.")
        }
        try {
            DateTime.parse("2023-04-10T-2", "yyyy-MM-ddTH")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: expected an integer, got '-'.")
        }
    }

    @TestCase
    func checkInputForFormatParseForMinute(): Unit {
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTmm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid minute value: expected 0 to 59.")
        }
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid minute value: expected 0 to 59.")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTmm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTmmm")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'm' exceeds maximum length 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddTmm-mm")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate minute format.")
        }
    }

    @TestCase
    func checkInputForFormatParseForSecond(): Unit {
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTss")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid second value: expected 0 to 59.")
        }
        try {
            DateTime.parse("2023-04-10T60", "yyyy-MM-ddTs")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid second value: expected 0 to 59.")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTss")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTsss")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 's' exceeds maximum length 2.")
        }
        try {
            DateTime.parse("2023-04-10T01-01", "yyyy-MM-ddTss-ss")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate second format.")
        }
    }

    @TestCase
    func checkInputForFormatParseForNanosecond(): Unit {
        try {
            DateTime.parse("2023-04-10T1", "yyyy-MM-ddTS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T-123", "yyyy-MM-ddTS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: expected an integer, got '-'.")
        }
        try {
            DateTime.parse("2023-04-10T1234", "yyyy-MM-ddTSS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T1234567", "yyyy-MM-ddTSSS")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: insufficient remaining length.")
        }
        try {
            DateTime.parse("2023-04-10T123456789", "yyyy-MM-ddTSSSS")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'S' exceeds maximum length 3.")
        }
        try {
            DateTime.parse("2023-04-10T123-123", "yyyy-MM-ddTS-S")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate nanosecond format.")
        }
    }
    @TestCase
    func checkInputForFormatParseForZone_1(): Unit {
        try {
            DateTime.parse("2023-04-10 +8", "yyyy-MM-dd O")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +08", "yyyy-MM-dd OO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +08:00", "yyyy-MM-dd OOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +08:-00", "yyyy-MM-dd OOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 Z", "yyyy-MM-dd O")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 +26:00:00", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in offset: expected -24 to 25.")
        }
        try {
            DateTime.parse("2023-04-10 -25:00:00", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in offset: expected -24 to 25.")
        }
        try {
            DateTime.parse("2023-04-10 +23:60:00", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid minute or second in offset: expected 0 to 59.")
        }
        try {
            DateTime.parse("2023-04-10 +23:30:60", "yyyy-MM-dd OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid minute or second in offset: expected 0 to 59.")
        }
        try {
            DateTime.parse("2023-04-10 Z", "yyyy-MM-dd OOOOO")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'O' exceeds maximum length 4.")
        }
        try {
            DateTime.parse("2023-04-10 Z GMT+00:00", "yyyy-MM-dd OOOO ZZZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate zone offset format.")
        }
        try {
            DateTime.parse("+08:00:0:0", "OOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 8: expected an integer, got ':\'.")
        }
    }

    @TestCase
    func checkInputForFormatParseForZone_2(): Unit {
        try {
            DateTime.parse("2023-04-10 Asia//Shanghai", "yyyy-MM-dd zzzz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra value starting at index 16.")
        }
        try {
            DateTime.parse("2023-04-10 Asia\\Shanghai", "yyyy-MM-dd zzzz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message.contains("Invalid zone name or zone ID.") || e.message.contains("Extra value"), true)
        }
        try {
            DateTime.parse("2023-04-10 XXT", "yyyy-MM-dd zz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone name or zone ID.")
        }
        try { // cannot load: exist but not in usr/share/zoneinfo
            DateTime.parse("2023-04-10 ACWST", "yyyy-MM-dd zz")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone name or zone ID.")
        }
        try {
            DateTime.parse("2023-04-10 CST", "yyyy-MM-dd zzzzz")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'z' exceeds maximum length 4.")
        }
        try {
            DateTime.parse("2023-04-25 CST CST", "yyyy-MM-dd z z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate zone ID format.")
        }
        try {
            DateTime.parse("2023-05-04T Asia/Shanghai +09:00", "yyyy-MM-ddT zzzz OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Zone offset does not match.")
        }
    }

    @TestCase
    func checkInputForFormatParseForZone_3(): Unit {
        try {
            DateTime.parse("2023-04-10 GMT+08:00", "yyyy-MM-dd Z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra value starting at index 17.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+08:00:00", "yyyy-MM-dd ZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra value starting at index 20.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+8", "yyyy-MM-dd ZZZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+8", "yyyy-MM-dd ZZZZZ")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'Z' exceeds maximum length 4.")
        }
        try {
            DateTime.parse("2023-04-10 GMT+00:00 Z", "yyyy-MM-dd ZZZZ OOOO")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate zone offset format.")
        }
        try {
            DateTime.parse("a", "Z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value: insufficient length.")
        }
        try {
            DateTime.parse("2023-04-10 GMT08:00:00", "yyyy-MM-dd ZZZZ")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Zone offset must start with '+' or '-'.")
        }
        try {
            DateTime.parse("2023-04-10 GMT08", "yyyy-MM-dd Z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Zone offset must start with '+' or '-'.")
        }
    }

    @TestCase
    func checkInputForFormatParseForEra(): Unit {
        try {
            DateTime.parse("2023 A 04-10", "yyyy GGGG MM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'G' exceeds maximum length 3.")
        }
        try {
            DateTime.parse("2023 A 04-10", "yyyy GG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid era value 'A '.")
        }
        try {
            DateTime.parse("2023 AD 04-10", "yyyy GGG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid era value: insufficient length.")
        }
        try {
            DateTime.parse("2023 B 04-10", "yyyy G MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid era value 'B'.")
        }
        try {
            DateTime.parse("2023 BD 04-10", "yyyy GG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid era value 'BD'.")
        }
        try {
            DateTime.parse("2023 Bnno Domini 04-10", "yyyy GGG MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid era value 'Bnno Domini'.")
        }
        try {
            DateTime.parse("2023 A A 04-10", "yyyy G G MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate era value.")
        }
    }

    @TestCase
    func checkInputForFormatParseForApm(): Unit {
        try { // n > 1
            DateTime.parse("2023 04-10 01 AM", "yyyy MM-dd hh aa")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'a' exceeds maximum length 1.")
        }
        try { // hour(1) in 24h but use PM
            DateTime.parse("2023 04-10 01 PM", "yyyy MM-dd HH a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid time: expected afternoon (PM).")
        }
        try { // hour(13) in 24h but use AM
            DateTime.parse("2023 04-10 13 AM", "yyyy MM-dd HH a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid time: expected morning (AM).")
        }
        try {
            DateTime.parse("2023 04-10 01 A", "yyyy MM-dd HH a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid AM/PM value: insufficient length.")
        }
        try {
            DateTime.parse("2023 04-10 01 AM AM", "yyyy MM-dd HH a a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate AM/PM value.")
        }
        try {
            DateTime.parse("2023-04-25 AP", "yyyy-MM-dd a")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid AM/PM value.")
        }
    }

    @TestCase
    func checkInputForFormatParseForIsoYear(): Unit {
        try {
            DateTime.parse("1-04-10", "Y-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 1: expected an integer, got '-'.")
        }
        try {
            DateTime.parse("111-04-10", "YYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 3: expected an integer, got '-'.")
        }
        try {
            DateTime.parse("1111-04-10", "YYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Missing year value.")
        }
        try {
            DateTime.parse("11111-04-10", "YYYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 4: expected '-', got '1'.")
        }
        try {
            DateTime.parse("999999999-04-10", "YYYYYYYYYY-MM-dd")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid format string: character 'Y' exceeds maximum length 9.")
        }
        try {
            DateTime.parse("2023-2023-04-10", "YYYY-YYYY-MM-dd")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Duplicate year format.")
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
            @Expect(e.message, "Invalid format string: character 'W' exceeds maximum length 2.")
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
            @Expect(e.message, "Duplicate ISO week format.")
        }
        try {
            DateTime.parse("2023-01-04T-2", "yyyy-MM-ddTW")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: expected an integer, got '-'.")
        }
        @Expect(1, 1)
    }

    @TestCase
    func checkInputForFormatParseForExtra(): Unit {
        try {
            DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO z")
            @Expect(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "No value to match ' '.")
        }
    }
}
