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
class Test_parse_minute {
    @TestCase
    func test_minute_m(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:0:00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        let res2 = DateTime.parse("2023/04/17 19:00:00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 19:59:00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        let res4 = DateTime.parse("-2023/04/17 19:59:00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        @Assert(res1.toString(),"2023-04-17T19:00:00Z")
        @Assert(res2.toString(),"2023-04-17T19:00:00Z")
        @Assert(res3.toString(),"2023-04-17T19:59:00Z")
        @Assert(res4.toString(),"-2023-04-17T19:59:00Z")

        try {
            let res5 = DateTime.parse("2023/04/17 19:-1:00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 14: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:60:00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Minute value must be in [0, 59].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:001:00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 16: \"1\" should be \":\".")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19::00 +00:00", "yyyy/MM/dd HH:m:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 14: \":\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_minute_mm(): Unit {
        var cnt = 0
        let res2 = DateTime.parse("2023/04/17 19:00:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 19:59:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res4 = DateTime.parse("-2023/04/17 19:59:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res2.toString(),"2023-04-17T19:00:00Z")
        @Assert(res3.toString(),"2023-04-17T19:59:00Z")
        @Assert(res4.toString(),"-2023-04-17T19:59:00Z")

        try {
            let res5 = DateTime.parse("2023/04/17 19:-1:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 14: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:60:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Minute value must be in [0, 59].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:001:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 16: \"1\" should be \":\".")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19::00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 14: \":\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }
}
