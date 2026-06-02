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
class Test_parse_month {
    @TestCase
    func test_month_M(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/1/17 19:52:23 +00:00", "yyyy/M/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/01/17 19:52:23 +00:00", "yyyy/M/dd HH:mm:ss OOOO")
        let res3 = DateTime.parse("2023/11/17 19:52:23 +00:00", "yyyy/M/dd HH:mm:ss OOOO")
        @Expect(res1.toString(),"2023-01-17T19:52:23Z")
        @Expect(res2.toString(),"2023-01-17T19:52:23Z")
        @Expect(res3.toString(),"2023-11-17T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/00/17 19:52:23 +00:00", "yyyy/M/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Month value must be in [1, 12].")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/13/17 19:52:23 +00:00", "yyyy/M/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Month value must be in [1, 12].")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/113/17 19:52:23 +00:00", "yyyy/M/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 7: \"3\" should be \"/\".")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023//17 19:52:23 +00:00", "yyyy/M/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 5: \"/\" should be integer.")
            cnt += 1
        }
        @Expect(cnt, 4)
    }

    @TestCase
    func test_month_M2(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/01/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/11/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res1.toString(),"2023-01-17T19:52:23Z")
        @Expect(res2.toString(),"2023-11-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/1/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 6: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/011/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 7: \"1\" should be \"/\".")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/JAN/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 5: \"J\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023//17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 5: \"/\" should be integer.")
            cnt += 1
        }
        @Expect(cnt, 4)
    }

    @TestCase
    func test_month_M3(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/Jan/17 19:52:23 +00:00", "yyyy/MMM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/Dec/17 19:52:23 +00:00", "yyyy/MMM/dd HH:mm:ss OOOO")
        @Expect(res1.toString(),"2023-01-17T19:52:23Z")
        @Expect(res2.toString(),"2023-12-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/Ja/17 19:52:23 +00:00", "yyyy/MMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/Jann/17 19:52:23 +00:00", "yyyy/MMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 8: \"n\" should be \"/\".")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/11/17 19:52:23 +00:00", "yyyy/MMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023//17 19:52:23 +00:00", "yyyy/MMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }
        @Expect(cnt, 4)
    }

    @TestCase
    func test_month_M4(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/January/17 19:52:23 +00:00", "yyyy/MMMM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/December/17 19:52:23 +00:00", "yyyy/MMMM/dd HH:mm:ss OOOO")
        @Expect(res1.toString(),"2023-01-17T19:52:23Z")
        @Expect(res2.toString(),"2023-12-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/Ja/17 19:52:23 +00:00", "yyyy/MMMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/Jann/17 19:52:23 +00:00", "yyyy/MMMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/11/17 19:52:23 +00:00", "yyyy/MMMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023//17 19:52:23 +00:00", "yyyy/MMMM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }
        @Expect(cnt, 4)
    }
}
