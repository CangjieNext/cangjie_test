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
class Test_parse_second {
    @TestCase
    func test_second_s(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:00:00 +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        let res2 = DateTime.parse("2023/04/17 19:00:00 +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        let res3 = DateTime.parse("2023/04/17 19:00:59 +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        let res4 = DateTime.parse("-2023/04/17 19:00:59 +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        @Assert(res1.toString(),"2023-04-17T19:00:00Z")
        @Assert(res2.toString(),"2023-04-17T19:00:00Z")
        @Assert(res3.toString(),"2023-04-17T19:00:59Z")
        @Assert(res4.toString(),"-2023-04-17T19:00:59Z")

        try {
            let res5 = DateTime.parse("2023/04/17 19:00:-1 +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 17: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:00:60 +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Second value must be in [0, 59].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:00:001 +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 19: \"1\" should be \" \".")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19:00: +00:00", "yyyy/MM/dd HH:mm:s OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 17: \" \" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_second_ss(): Unit {
        var cnt = 0
        let res2 = DateTime.parse("2023/04/17 19:00:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 19:59:59 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res4 = DateTime.parse("-2023/04/17 19:59:59 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res2.toString(),"2023-04-17T19:00:00Z")
        @Assert(res3.toString(),"2023-04-17T19:59:59Z")
        @Assert(res4.toString(),"-2023-04-17T19:59:59Z")

        try {
            let res5 = DateTime.parse("2023/04/17 19:00:-1 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 17: \"-\" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:00:60 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Second value must be in [0, 59].")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:00:001 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 19: \"1\" should be \" \".")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19:00: +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 17: \" \" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_nanosecond_S(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 000 +00:00", "yyyy/MM/dd HH:mm:ss S OOOO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 999 +00:00", "yyyy/MM/dd HH:mm:ss S OOOO")
        let res3 = DateTime.parse("-2023/04/17 19:52:23 000 +00:00", "yyyy/MM/dd HH:mm:ss S OOOO")

        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"2023-04-17T19:52:23.999Z")
        @Assert(res3.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss S OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 20: \"+\" should be integer.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 00 +00:00", "yyyy/MM/dd HH:mm:ss S OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 22: \" \" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:52:23 0000 +00:00", "yyyy/MM/dd HH:mm:ss S OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 23: \"0\" should be \" \".")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:52:23 SSS +00:00", "yyyy/MM/dd HH:mm:ss S OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 20: \"S\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_nanosecond_SS(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 000000 +00:00", "yyyy/MM/dd HH:mm:ss SS OOOO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 999999 +00:00", "yyyy/MM/dd HH:mm:ss SS OOOO")
        let res3 = DateTime.parse("-2023/04/17 19:52:23 000000 +00:00", "yyyy/MM/dd HH:mm:ss SS OOOO")

        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"2023-04-17T19:52:23.999999Z")
        @Assert(res3.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss SS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 20: \"+\" should be integer.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 00000 +00:00", "yyyy/MM/dd HH:mm:ss SS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 25: \" \" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:52:23 0000000 +00:00", "yyyy/MM/dd HH:mm:ss SS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 26: \"0\" should be \" \".")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:52:23 SSSSSS +00:00", "yyyy/MM/dd HH:mm:ss SS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 20: \"S\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }

    @TestCase
    func test_nanosecond_SSS(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 000000000 +00:00", "yyyy/MM/dd HH:mm:ss SSS OOOO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 999999999 +00:00", "yyyy/MM/dd HH:mm:ss SSS OOOO")
        let res3 = DateTime.parse("-2023/04/17 19:52:23 000000000 +00:00", "yyyy/MM/dd HH:mm:ss SSS OOOO")

        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"2023-04-17T19:52:23.999999999Z")
        @Assert(res3.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss SSS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 20: insufficient remaining length.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 00000 +00:00", "yyyy/MM/dd HH:mm:ss SSS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 25: \" \" should be integer.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:52:23 0000000 +00:00", "yyyy/MM/dd HH:mm:ss SSS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: \" \" should be integer.")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:52:23 SSSSSS +00:00", "yyyy/MM/dd HH:mm:ss SSS OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 20: \"S\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 4)
    }
}
