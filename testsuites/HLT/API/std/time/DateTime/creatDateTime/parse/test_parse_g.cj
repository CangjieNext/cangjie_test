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
class Test_parse_g {
    @TestCase
    func test_parse_g(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 19:52:23 +00:00 A", "yyyy/MM/dd HH:mm:ss OOOO G")

        try {
            let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 AD", "yyyy/MM/dd HH:mm:ss OOOO G")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 28.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20 19:52:23 +00:00 Anno Domini", "yyyy/MM/dd HH:mm:ss OOOO G")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 28.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 19:52:23 +00:00 0", "yyyy/MM/dd HH:mm:ss OOOO G")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal era value.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 19:52:23 +00:00 a", "yyyy/MM/dd HH:mm:ss OOOO G")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Illegal era value.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_parse_gg(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 19:52:23 +00:00 AD", "yyyy/MM/dd HH:mm:ss OOOO GG")

        try {
            let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 A", "yyyy/MM/dd HH:mm:ss OOOO GG")
        } catch (e2: TimeParseException) {
            @Expect(e2.message, "Illegal era value.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20 19:52:23 +00:00 Anno Domini", "yyyy/MM/dd HH:mm:ss OOOO GG")
        } catch (e3: TimeParseException) {
            @Expect(e3.message, "Illegal era value.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 19:52:23 +00:00 00", "yyyy/MM/dd HH:mm:ss OOOO GG")
        } catch (e4: TimeParseException) {
            @Expect(e4.message, "Illegal era value.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 19:52:23 +00:00 ad", "yyyy/MM/dd HH:mm:ss OOOO GG")
        } catch (e5: TimeParseException) {
            @Expect(e5.message, "Illegal era value.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_parse_ggg(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/20 19:52:23 +00:00 Anno Domini", "yyyy/MM/dd HH:mm:ss OOOO GGG")

        try {
            let res2 = DateTime.parse("2023/04/20 19:52:23 +00:00 A", "yyyy/MM/dd HH:mm:ss OOOO GGG")
        } catch (e2: TimeParseException) {
            @Expect(e2.message, "Illegal era value.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20 19:52:23 +00:00 AD", "yyyy/MM/dd HH:mm:ss OOOO GGG")
        } catch (e3: TimeParseException) {
            @Expect(e3.message, "Illegal era value.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 19:52:23 +00:00 00", "yyyy/MM/dd HH:mm:ss OOOO GGG")
        } catch (e4: TimeParseException) {
            @Expect(e4.message, "Illegal era value.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 19:52:23 +00:00 ad", "yyyy/MM/dd HH:mm:ss OOOO GGG")
        } catch (e5: TimeParseException) {
            @Expect(e5.message, "Illegal era value.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }
}
