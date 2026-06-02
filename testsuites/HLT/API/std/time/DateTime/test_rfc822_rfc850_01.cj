/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:  %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output

import std.time.*

@Test
class Test_Format_RFC822 {
    let fmt = DateTimeFormat.of(DateTimeFormat.RFC822)

    @TestCase
    func test_format() {
        println(DateTimeFormat.RFC822)
        @Expect(fmt.format, "ww dd MMM yy HH:mm:ss z")
    }

    @TestCase
    func test_parseTime() {
        let s = "04 20 Jun 24 14:42:33 UTC"
        let t = DateTime.parse(s, fmt)
        @Assert(t.year, 2024)
        @Assert(t.month.value(), 6)
        @Assert(t.hour, 14)
        @Assert(t.minute, 42)
        @Assert(t.zoneId, "UTC")
    }

    @TestCase
    func test_parseTimeException() {
        let s = "04 20 Jun 24 14:42:33.55 UTC"
        try {
            DateTime.parse(s, fmt)
            @Assert(false)
        } catch (e: TimeParseException) {
            @Assert(e.message, "Fail to parse at index 21: \".\" should be \" \".")
            @Assert(true)
        }
    }
}

@Test
class Test_Format_RFC850 {
    let fmt = DateTimeFormat.of(DateTimeFormat.RFC850)

    @TestCase
    func test_format() {
        @Expect(fmt.format, "wwww, dd-MMM-yy HH:mm:ss z")
    }

    @TestCase
    func test_parseTime() {
        let s = "Thursday, 20-Jun-24 14:42:33 UTC"
        let t = DateTime.parse(s, fmt)
        @Assert(t.year, 2024)
        @Assert(t.month.value(), 6)
        @Assert(t.hour, 14)
        @Assert(t.minute, 42)
        @Assert(t.zoneId, "UTC")
    }

    @TestCase
    func test_parseTimeException() {
        let s = "Thursday, 04-Jun-24 14:42:33.55 UTC"
        try {
            DateTime.parse(s, fmt)
            @Assert(false)
        } catch (e: TimeParseException) {
            @Assert(e.message, "Fail to parse at index 28: \".\" should be \" \".")
            @Assert(true)
        }
    }

    @TestCase
    func test_timeToString() {
        let t = DateTime.of(year: 2024, month: Month.June, dayOfMonth: 20, hour: 14, minute: 42, second: 33,
            nanosecond: 0, timeZone: TimeZone("UTC", Duration.hour * 8))
        let str = t.toString(fmt)
        @Assert(str, "Thursday, 20-Jun-24 14:42:33 UTC")
    }
}
