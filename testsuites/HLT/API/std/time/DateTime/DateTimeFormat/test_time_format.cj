/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.time.*

@Test
class Test_Format_RFC1123 {
    let fmt = DateTimeFormat.of(DateTimeFormat.RFC1123)

    @TestCase
    func test_format() {
        @Expect(fmt.format, "www, dd MMM yyyy HH:mm:ss z")
    }

    @TestCase
    func test_parseTime() {
        let s = "Thu, 20 Jun 2024 14:42:33 UTC"
        let t = DateTime.parse(s, fmt)
        let t2 = DateTime.parse(s, "www, dd MMM yyyy HH:mm:ss z")
        @Assert(t, t2)
        @Assert(t.year, 2024)
        @Assert(t.month.value(), 6)
        @Assert(t.dayOfMonth, 20)
        @Assert(t.hour, 14)
        @Assert(t.minute, 42)
        @Assert(t.second, 33)
        @Assert(t.zoneId, "UTC")
    }

    @TestCase
    func test_parseTimeException() {
        let s = "Thu, 20 Jun 2024 14:42:33.5 UTC"
        try {
            DateTime.parse(s, fmt)
            @Assert(false)
        } catch (e: TimeParseException) {
            @Assert(e.message, "Fail to parse at index 25: \".\" should be \" \".")
            @Assert(true)
        }
    }

    @TestCase
    func test_timeToString() {
        let t = DateTime.of(year: 2024, month: Month.June, dayOfMonth: 20, hour: 14, minute: 42, second: 33,
            nanosecond: 0, timeZone: TimeZone.UTC)
        let str = t.toString(fmt)
        let str2 = t.format("www, dd MMM yyyy HH:mm:ss z")
        @Assert(str,str2)
        @Assert(str, "Thu, 20 Jun 2024 14:42:33 UTC")
    }
}

@Test
class Test_Format_RFC3339 {
    let fmt = DateTimeFormat.of(DateTimeFormat.RFC3339)

    @TestCase
    func test_format() {
        @Expect(fmt.format, "yyyy-MM-ddTHH:mm:ssOOOO")
    }

    @TestCase
    func test_parseTime() {
        let s = "2024-06-20T14:42:33+08:00"
        let t = DateTime.parse(s, fmt)
        let t2 = DateTime.parse(s, "yyyy-MM-ddTHH:mm:ssOOOO")
        @Assert(t, t2)
        @Assert(t.year, 2024)
        @Assert(t.month.value(), 6)
        @Assert(t.dayOfMonth, 20)
        @Assert(t.hour, 14)
        @Assert(t.minute, 42)
        @Assert(t.second, 33)
        @Assert(t.zoneId, "GMT+8")
    }

    @TestCase
    func test_parseTimeException() {
        let s = "2024-06-20T14:42:33+08:008"
        try {
            DateTime.parse(s, fmt)
            @Assert(false)
        } catch (e: TimeParseException) {
            @Assert(e.message, "Extar value, start at index 25.")
            @Assert(true)
        }
    }

    @TestCase
    func test_timeToString() {
        let t = DateTime.of(year: 2024, month: Month.June, dayOfMonth: 20, hour: 14, minute: 42, second: 33,
            nanosecond: 0, timeZone: TimeZone("ABC", Duration.hour * 8))
        let str = t.toString(fmt)
        let str2 = t.format("yyyy-MM-ddTHH:mm:ssOOOO")
        @Assert(str, str2)
        @Assert(str, "2024-06-20T14:42:33+08:00")
    }
}

@Test
class Test_Format_SelfDefine {
    let fmt = DateTimeFormat.of("yyyy年MM月dd日HH时mm分ss秒OO")

    @TestCase
    func test_format() {
        @Expect(fmt.format, "yyyy年MM月dd日HH时mm分ss秒OO")
    }

    @TestCase
    func test_parseTime() {
        let s = "2024年06月20日14时42分33秒+08:00"
        let t = DateTime.parse(s, fmt)
        let t2 = DateTime.parse(s, "yyyy年MM月dd日HH时mm分ss秒OO")
        @Assert(t, t2)
        @Assert(t.year, 2024)
        @Assert(t.month.value(), 6)
        @Assert(t.dayOfMonth, 20)
        @Assert(t.hour, 14)
        @Assert(t.minute, 42)
        @Assert(t.second, 33)
        @Assert(t.zoneId, "GMT+8")
    }

    @TestCase
    func test_parseTimeException() {
        let s = "2024年06月20日14时42分33秒+08:008"
        try {
            DateTime.parse(s, fmt)
            @Assert(false)
        } catch (e: TimeParseException) {
            @Assert(e.message, "Extar value, start at index 26.")
            @Assert(true)
        }
    }

    @TestCase
    func test_timeToString() {
        let t = DateTime.of(year: 2024, month: Month.June, dayOfMonth: 20, hour: 14, minute: 42, second: 33,
            nanosecond: 0, timeZone: TimeZone("ABC", Duration.hour * 8))
        let str = t.toString(fmt)
        let str2 = t.format("yyyy年MM月dd日HH时mm分ss秒OO")
        @Assert(str, str2)
        @Assert(str, "2024年06月20日14时42分33秒+08:00")
    }
}

func ExpectException(str: String): Bool {
    try {
        DateTimeFormat.of(str)
        println(str)
        return false
    } catch (e: IllegalArgumentException) {
        return true
    }
}

@Test
class Test_DateTimeFormat {
    @TestCase
    func test_parseTime(): Unit {
        var layout = "yyyy-MM-dd HH:mm:ss"
        var s = "2022-02-27 15:40:27"
        let t = DateTime.parse(s, layout)

        let fmt = DateTimeFormat.of(layout)
        let t2 = DateTime.parse(s, fmt)

        @Expect(t, t2)
    }

    @TestCase
    func test_toString(): Unit {
        let t = DateTime.now()
        let layout = "yyyy-MM-dd HH:mm:ss"
        let fmt = DateTimeFormat.of(layout)
        let s = t.toString(fmt)
        let s2 = t.format(layout)
        @Expect(s, s2)
    }

    @TestCase
    func test_parseTime2(): Unit {
        var s = "2024-06-12T16:05:46.802633211+08:00"
        let t = DateTime.parse(s)
        @Expect(t.year, 2024)
        @Expect(t.month.value(), 6)
        @Expect(t.dayOfMonth, 12)
        @Expect(t.hour, 16)
        @Expect(t.minute, 5)
        @Expect(t.second, 46)
        @Expect(t.nanosecond, 802633211)
    }

    @TestCase
    func test_init_exception(): Unit {
        @Expect(ExpectException("MM-dd-yyyyyyyyyyy HH:mm:ss.SS"))
        @Expect(ExpectException("yyyy-MM-dd HH:mm:ss.SSSS"))
        @Expect(ExpectException("yyyy-MM-dd HH:mmm:ss"))
        @Expect(ExpectException("yyyy-MM-dd HHH:mm:ss"))
        @Expect(ExpectException("yyyy-MM-dd HH:m:ss OOOOO"))
    }
}
