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
class Test_parse_isoWeek {
    @TestCase
    func test_isoWeek_W(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/01/08 19:52:23 +00:00 1", "yyyy/MM/dd HH:mm:ss OOOO W")
        let res2 = DateTime.parse("2023/01/09 19:52:23 +00:00 02", "yyyy/MM/dd HH:mm:ss OOOO W")
        let res3 = DateTime.parse("2023/01/08 19:52:23 +00:00 0", "yyyy/MM/dd HH:mm:ss OOOO W")
        @Expect(res1.toString(),"2023-01-08T19:52:23Z")
        @Expect(res2.toString(),"2023-01-09T19:52:23Z")
        @Expect(res3.toString(),"2023-01-08T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/01/08 19:52:23 +00:00 s", "yyyy/MM/dd HH:mm:ss OOOO W")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: \"s\" should be integer.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/01/08 19:52:23 +00:00 001", "yyyy/MM/dd HH:mm:ss OOOO W")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 29.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/01/08 19:52:23 +00:00    ", "yyyy/MM/dd HH:mm:ss OOOO W")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: \" \" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 3)
    }

    @TestCase
    func test_isoWeek_WW(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/01/09 19:52:23 +00:00 02", "yyyy/MM/dd HH:mm:ss OOOO WW")
        @Expect(res1.toString(),"2023-01-09T19:52:23Z")

        try {
            let res2 = DateTime.parse("2023/01/09 19:52:23 +00:00 2", "yyyy/MM/dd HH:mm:ss OOOO WW")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: insufficient remaining length.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/01/08 19:52:23 +00:00 0", "yyyy/MM/dd HH:mm:ss OOOO WW")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: insufficient remaining length.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/01/08 19:52:23 +00:00 s", "yyyy/MM/dd HH:mm:ss OOOO WW")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: insufficient remaining length.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/01/08 19:52:23 +00:00 001", "yyyy/MM/dd HH:mm:ss OOOO WW")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 29.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/01/08 19:52:23 +00:00    ", "yyyy/MM/dd HH:mm:ss OOOO WW")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: \" \" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 5)
    }
}
