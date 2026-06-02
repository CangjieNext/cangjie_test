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
class Test_parse_week {
    @TestCase
    func test_week_w(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 19:52:23 +00:00 4", "yyyy/MM/dd HH:mm:ss OOOO w")
        @Expect(res1.toString(),"2023-04-20T19:52:23Z")

        let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 04", "yyyy/MM/dd HH:mm:ss OOOO w")
        @Expect(res1.toString(),"2023-04-20T19:52:23Z")

        try {
            let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 0", "yyyy/MM/dd HH:mm:ss OOOO w")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The day of week does not match.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20 19:52:23 +00:00 s", "yyyy/MM/dd HH:mm:ss OOOO w")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: \"s\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 2)
    }

    @TestCase
    func test_week_ww(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 19:52:23 +00:00 04", "yyyy/MM/dd HH:mm:ss OOOO ww")
        @Expect(res1.toString(),"2023-04-20T19:52:23Z")

        try {
            let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 4", "yyyy/MM/dd HH:mm:ss OOOO ww")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: insufficient remaining length.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20 19:52:23 +00:00 s", "yyyy/MM/dd HH:mm:ss OOOO ww")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: insufficient remaining length.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 19:52:23 +00:00 Thu", "yyyy/MM/dd HH:mm:ss OOOO ww")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: \"T\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 3)
    }

    @TestCase
    func test_week_www(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 19:52:23 +00:00 Thu", "yyyy/MM/dd HH:mm:ss OOOO www")
        @Expect(res1.toString(),"2023-04-20T19:52:23Z")

        try {
            let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 4", "yyyy/MM/dd HH:mm:ss OOOO www")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20 19:52:23 +00:00 04", "yyyy/MM/dd HH:mm:ss OOOO www")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 19:52:23 +00:00 004", "yyyy/MM/dd HH:mm:ss OOOO www")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 19:52:23 +00:00 Thursday", "yyyy/MM/dd HH:mm:ss OOOO www")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 30.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_week_wwww(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 19:52:23 +00:00 Thursday", "yyyy/MM/dd HH:mm:ss OOOO wwww")
        @Expect(res1.toString(),"2023-04-20T19:52:23Z")

        try {
            let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 4", "yyyy/MM/dd HH:mm:ss OOOO wwww")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20 19:52:23 +00:00 04", "yyyy/MM/dd HH:mm:ss OOOO wwww")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 19:52:23 +00:00 004", "yyyy/MM/dd HH:mm:ss OOOO wwww")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 19:52:23 +00:00 Thu", "yyyy/MM/dd HH:mm:ss OOOO wwww")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse dayOfWeek or month.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }
}
