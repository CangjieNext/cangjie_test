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
            @Expect(e.message, "Fail to parse at index 1: \"-\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 2: \"-\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 3: \"-\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 4: \"1\" should be \"-\".")
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
            @Expect(e.message, "Fail to parse at index 6: \"-\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 5: \"-\" should be integer.")
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
            @Expect(e.message, "Month value must be in [1, 12].")
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
            @Expect(e.message, "Fail to parse at index 5: \"A\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 9: \"T\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 8: \"-\" should be integer.")
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
            @Expect(e.message, "Day of February in 2023 must be in [1, 28].")
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
            @Expect(e.message, "Fail to parse at index 12: \":\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
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
            @Expect(e.message, "Hour value in format \"HH\" must be in [0, 23].")
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
            @Expect(e.message, "Fail to parse at index 15: \":\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 14: \"-\" should be integer.")
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
            @Expect(e.message, "Minute value must be in [0, 59].")
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
            @Expect(e.message, "Fail to parse at index 18: \"+\" should be integer.")
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
            @Expect(e.message, "Fail to parse at index 17: \"-\" should be integer.")
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
            @Expect(e.message, "Second value must be in [0, 59].")
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
            @Expect(e.message, "The hour in offset should be in [-24, 25].")
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
            @Expect(e.message, "The hour in offset should be in [-24, 25].")
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
            @Expect(e.message, "Illegal zone offset value.")
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
            @Expect(e.message, "Fail to parse at index 22: \"8\" should be \":\".")
        }
        try {
            @Expect(DateTime.tryParse("2023-04-06T20:17:30+008:0"), None)
        } catch (e: TimeParseException) {
            @Assert(false)
        }
    }
}
