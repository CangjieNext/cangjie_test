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
class Test_parse_day {
    @TestCase
    func test_day_d(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/7 19:52:23 +00:00", "yyyy/MM/d HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/d HH:mm:ss OOOO")
        @Expect(res1.toString(),"2023-04-07T19:52:23Z")
        @Expect(res2.toString(),"2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/0 19:52:23 +00:00", "yyyy/MM/d HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day '0' for April 2023: expected 1 to 30.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/00 19:52:23 +00:00", "yyyy/MM/d HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day '0' for April 2023: expected 1 to 30.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2000/02/30 19:52:23 +00:00", "yyyy/MM/d HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day '30' for February 2000: expected 1 to 29.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/dd 19:52:23 +00:00", "yyyy/MM/d HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 8: expected an integer, got 'd'.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_day_d2(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/07 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res1.toString(),"2023-04-07T19:52:23Z")
        @Expect(res2.toString(),"2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/0 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 9: expected an integer, got ' '.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/00 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day '0' for April 2023: expected 1 to 30.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2000/02/30 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Invalid day '30' for February 2000: expected 1 to 29.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/dd 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 8: expected an integer, got 'd'.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_day_D(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/01/01 19:52:23 +00:00 1", "yyyy/MM/dd HH:mm:ss OOOO D")
        let res2 = DateTime.parse("2023/01/01 19:52:23 +00:00 01", "yyyy/MM/dd HH:mm:ss OOOO D")
        let res3 = DateTime.parse("2023/01/01 19:52:23 +00:00 001", "yyyy/MM/dd HH:mm:ss OOOO D")
        @Expect(res1.toString(),"2023-01-01T19:52:23Z")
        @Expect(res2.toString(),"2023-01-01T19:52:23Z")
        @Expect(res3.toString(),"2023-01-01T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/01/01 19:52:23 +00:00 0001", "yyyy/MM/dd HH:mm:ss OOOO D")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of year cannot be zero.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/01/01 19:52:23 +00:00 2", "yyyy/MM/dd HH:mm:ss OOOO D")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of month and day of year are inconsistent.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/01/01 19:52:23 +00:00 s", "yyyy/MM/dd HH:mm:ss OOOO D")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 27: day of year must be an integer.")
            cnt += 1
        }
    }

    @TestCase
    func test_day_DD(): Unit {
        var cnt = 0
        let res2 = DateTime.parse("2023/01/01 19:52:23 +00:00 01", "yyyy/MM/dd HH:mm:ss OOOO DD")
        let res3 = DateTime.parse("2023/01/01 19:52:23 +00:00 001", "yyyy/MM/dd HH:mm:ss OOOO DD")
        @Expect(res2.toString(),"2023-01-01T19:52:23Z")
        @Expect(res3.toString(),"2023-01-01T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/01/01 19:52:23 +00:00 0001", "yyyy/MM/dd HH:mm:ss OOOO DD")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of year cannot be zero.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/01/01 19:52:23 +00:00 2", "yyyy/MM/dd HH:mm:ss OOOO DD")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Day of month and day of year are inconsistent.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/01/01 19:52:23 +00:00 s", "yyyy/MM/dd HH:mm:ss OOOO DD")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Failed to parse at index 27: day of year must be an integer.")
            cnt += 1
        }
    }
}
