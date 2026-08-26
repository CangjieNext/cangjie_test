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
    func checkInputForParseForYear(): Unit {
        try {
            DateTime.parse("1-04-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 1: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("1-04-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("11-04-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 2: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("11-04-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("-04-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 3: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("-04-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("11111-04-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 4: expected '-', got '1'.")
        }
        try {
            @Expect(DateTime.tryParse("11111-04-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func checkInputForParseForMonth(): Unit {
        try {
            DateTime.parse("2023-4-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 6: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-4-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023--4-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 5: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("2023--4-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-13-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid month value: expected 1 to 12.")
        }
        try {
            @Expect(DateTime.tryParse("2023-13-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-April-12T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 5: expected an integer, got 'A'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-April-12T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func checkInputForParseForDayOfMonth(): Unit {
        try {
            DateTime.parse("2023-04-6T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 9: expected an integer, got 'T'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-6T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04--6T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 8: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04--6T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-02-29T20:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day '29' for February 2023: expected 1 to 28.")
        }
        try {
            @Expect(DateTime.tryParse("2023-02-29T20:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func checkInputForParseForHour(): Unit {
        try {
            DateTime.parse("2023-04-06T0:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 12: expected an integer, got ':'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T0:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T-1:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 11: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T-1:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T24:17:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in 'HH' format: expected 0 to 23.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T24:17:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func checkInputForParseForMinute(): Unit {
        try {
            DateTime.parse("2023-04-06T20:1:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 15: expected an integer, got ':'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:1:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T20:-1:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 14: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:-1:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T20:60:30+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid minute value: expected 0 to 59.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:60:30+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func checkInputForParseForSecond(): Unit {
        try {
            DateTime.parse("2023-04-06T20:17:3+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 18: expected an integer, got '+'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:3+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T20:17:-1+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 17: expected an integer, got '-'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:-1+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T20:17:60+08:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid second value: expected 0 to 59.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:60+08:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }

    @TestCase
    func checkInputForParseForOffset(): Unit {
        try {
            DateTime.parse("2023-04-06T20:17:30+26:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in offset: expected -24 to 25.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:30+26:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T20:17:30-25:00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid hour in offset: expected -24 to 25.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:30-25:00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T20:17:30+00")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid zone offset value.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:30+00"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
        try {
            DateTime.parse("2023-04-06T20:17:30+008:0")
            @Assert(false)
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 22: expected ':', got '8'.")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:30+008:0"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }
}
