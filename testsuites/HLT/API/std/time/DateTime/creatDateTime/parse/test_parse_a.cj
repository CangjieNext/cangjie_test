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
class Test_parse_a {
    @TestCase
    func test_parse_am(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 00:00:00 +00:00 AM", "yyyy/MM/dd HH:mm:ss OOOO a")
        let res2 = DateTime.parse("2023/04/20 11:59:59 +00:00 AM", "yyyy/MM/dd HH:mm:ss OOOO a")
        @Expect(res1.toString(),"2023-04-20T00:00:00Z")
        @Expect(res2.toString(),"2023-04-20T11:59:59Z")

        try {
            let res3 = DateTime.parse("2023/04/20 12:00:00 +00:00 AM", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The time is not in the morning.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 23:59:59 +00:00 AM", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The time is not in the morning.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 23:59:59 +00:00 A", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal AM/PM value.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/20 23:59:59 +00:00 am", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal AM/PM value.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_parse_pm(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 12:00:00 +00:00 PM", "yyyy/MM/dd HH:mm:ss OOOO a")
        let res2 = DateTime.parse("2023/04/20 23:59:59 +00:00 PM", "yyyy/MM/dd HH:mm:ss OOOO a")
        @Expect(res1.toString(),"2023-04-20T12:00:00Z")
        @Expect(res2.toString(),"2023-04-20T23:59:59Z")

        try {
            let res3 = DateTime.parse("2023/04/20 00:00:00 +00:00 PM", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The time is not in the afternoon.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 11:59:59 +00:00 PM", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The time is not in the afternoon.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 11:59:59 +00:00 P", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal AM/PM value.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/20 11:59:59 +00:00 pm", "yyyy/MM/dd HH:mm:ss OOOO a")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal AM/PM value.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }
}
