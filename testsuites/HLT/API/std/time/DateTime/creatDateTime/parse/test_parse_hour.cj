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
class Test_parse_hour {
    @TestCase
    func test_hour_h(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 1:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        let res2 = DateTime.parse("2023/04/17 01:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 12:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        let res4 = DateTime.parse("-2023/04/17 12:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        @Expect(res1.toString(),"2023-04-17T01:52:23Z")
        @Expect(res2.toString(),"2023-04-17T01:52:23Z")
        @Expect(res3.toString(),"2023-04-17T00:52:23Z")
        @Expect(res4.toString(),"-2023-04-17T00:52:23Z")

        try {
            let res5 = DateTime.parse("2023/04/20 -1:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        } catch (e5: TimeParseException) {
            @Expect(e5.message, "Fail to parse at index 11: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/20 24:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        } catch (e6: TimeParseException) {
            @Expect(e6.message, "Hour value in format \"hh\" must be in [1, 12].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/20 001:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        } catch (e7: TimeParseException) {
            @Expect(e7.message, "Hour value in format \"hh\" must be in [1, 12].")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/20 hh:52:23 +00:00", "yyyy/MM/dd h:mm:ss OOOO")
        } catch (e8: TimeParseException) {
            @Expect(e8.message, "Fail to parse at index 11: \"h\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_hour_hh(): Unit {
        var cnt = 0
        let res2 = DateTime.parse("2023/04/17 01:52:23 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 12:52:23 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
        let res4 = DateTime.parse("-2023/04/17 12:52:23 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
        @Expect(res2.toString(),"2023-04-17T01:52:23Z")
        @Expect(res3.toString(),"2023-04-17T00:52:23Z")
        @Expect(res4.toString(),"-2023-04-17T00:52:23Z")

        try {
            let res5 = DateTime.parse("2023/04/20 -1:52:23 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/20 24:52:23 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Hour value in format \"hh\" must be in [1, 12].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/20 001:52:23 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Hour value in format \"hh\" must be in [1, 12].")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/20 hh:52:23 +00:00", "yyyy/MM/dd hh:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"h\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_hour_H(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 0:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        let res2 = DateTime.parse("2023/04/17 00:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 12:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        let res4 = DateTime.parse("-2023/04/17 12:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        @Expect(res1.toString(),"2023-04-17T00:52:23Z")
        @Expect(res2.toString(),"2023-04-17T00:52:23Z")
        @Expect(res3.toString(),"2023-04-17T12:52:23Z")
        @Expect(res4.toString(),"-2023-04-17T12:52:23Z")

        try {
            let res5 = DateTime.parse("2023/04/20 -1:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/20 24:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Hour value in format \"HH\" must be in [0, 23].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/20 001:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 13: \"1\" should be \":\".")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/20 hh:52:23 +00:00", "yyyy/MM/dd H:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"h\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_hour_HH(): Unit {
        var cnt = 0
        let res2 = DateTime.parse("2023/04/17 00:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 12:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res4 = DateTime.parse("-2023/04/17 12:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res2.toString(),"2023-04-17T00:52:23Z")
        @Expect(res3.toString(),"2023-04-17T12:52:23Z")
        @Expect(res4.toString(),"-2023-04-17T12:52:23Z")

        try {
            let res5 = DateTime.parse("2023/04/20 -1:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/20 24:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Hour value in format \"HH\" must be in [0, 23].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/20 001:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 13: \"1\" should be \":\".")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/20 hh:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 11: \"h\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }
}
