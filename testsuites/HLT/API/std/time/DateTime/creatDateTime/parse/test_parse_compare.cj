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
class Test_parse_compare {
    @TestCase
    func test_parse_out_of_order(): Unit {
        let res1 = DateTime.parse("2023/04/20 00:00:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/20/04 00:00:00 +00:00", "yyyy/dd/MM HH:mm:ss OOOO")
        let res3 = DateTime.parse("04/2023/20 00:00:00 +00:00", "MM/yyyy/dd HH:mm:ss OOOO")
        let res4 = DateTime.parse("04/20/2023 00:00:00 +00:00", "MM/dd/yyyy HH:mm:ss OOOO")
        let res5 = DateTime.parse("20/2023/04 00:00:00 +00:00", "dd/yyyy/MM HH:mm:ss OOOO")
        let res6 = DateTime.parse("20/04/2023 00:00:00 +00:00", "dd/MM/yyyy HH:mm:ss OOOO")
        @Expect(res1.toString(),"2023-04-20T00:00:00Z")
        @Expect(res2.toString(),"2023-04-20T00:00:00Z")
        @Expect(res3.toString(),"2023-04-20T00:00:00Z")
        @Expect(res4.toString(),"2023-04-20T00:00:00Z")
        @Expect(res5.toString(),"2023-04-20T00:00:00Z")
        @Expect(res6.toString(),"2023-04-20T00:00:00Z")

        let res7 = DateTime.parse("2023/04/20 01:02:03 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res8 = DateTime.parse("2023/04/20 01:03:02 +00:00", "yyyy/MM/dd HH:ss:mm OOOO")
        let res9 = DateTime.parse("2023/04/20 02:01:03 +00:00", "yyyy/MM/dd mm:HH:ss OOOO")
        let res10 = DateTime.parse("2023/04/20 02:03:01 +00:00", "yyyy/MM/dd mm:ss:HH OOOO")
        let res11 = DateTime.parse("2023/04/20 03:01:02 +00:00", "yyyy/MM/dd ss:HH:mm OOOO")
        let res12 = DateTime.parse("2023/04/20 03:02:01 +00:00", "yyyy/MM/dd ss:mm:HH OOOO")
        @Expect(res7.toString(),"2023-04-20T01:02:03Z")
        @Expect(res8.toString(),"2023-04-20T01:02:03Z")
        @Expect(res9.toString(),"2023-04-20T01:02:03Z")
        @Expect(res10.toString(),"2023-04-20T01:02:03Z")
        @Expect(res11.toString(),"2023-04-20T01:02:03Z")
        @Expect(res12.toString(),"2023-04-20T01:02:03Z")

        let res13 = DateTime.parse("01:02:03 +00:00 2023/04/20", "HH:mm:ss OOOO yyyy/MM/dd")
        @Expect(res13.toString(),"2023-04-20T01:02:03Z")
    }

    @TestCase
    func test_parse_miss_part_format(): Unit {
        var cnt = 0
        try {
            let res1 = DateTime.parse("04/20 00:00:00 +00:00", "MM/dd HH:mm:ss OOOO")
        } catch (e1: TimeParseException) {
            @Expect(e1.message, "Lack of year value.")
            cnt += 1
        }

        try {
            let res2 = DateTime.parse("2023/20 00:00:00 +00:00", "yyyy/dd HH:mm:ss OOOO")
        } catch (e2: TimeParseException) {
            @Expect(e2.message, "Lack of month value.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04 00:00:00 +00:00", "yyyy/MM HH:mm:ss OOOO")
        } catch (e3: TimeParseException) {
            @Expect(e3.message, "Lack of dayOfMonth value.")
            cnt += 1
        }

        @Expect(cnt, 3)

        let res4 = DateTime.parse("2023/04/20 00:00 +00:00", "yyyy/MM/dd mm:ss OOOO")
        let res5 = DateTime.parse("2023/04/20 00:00 +00:00", "yyyy/MM/dd HH:ss OOOO")
        let res6 = DateTime.parse("2023/04/20 00:00 +00:00", "yyyy/MM/dd HH:mm OOOO")
        @Expect(res4.toString(),"2023-04-20T00:00:00Z")
        @Expect(res5.toString(),"2023-04-20T00:00:00Z")
        @Expect(res6.toString(),"2023-04-20T00:00:00Z")
    }

    @TestCase
    func test_parse_extra_part_format(): Unit {
        var cnt = 0
        try {
            let res1 = DateTime.parse("2023/04/20/2023 00:00:00 +00:00", "yyyy/MM/dd/yyyy HH:mm:ss OOOO")
        } catch (e1: TimeParseException) {
            @Expect(e1.message, "Extra year format.")
            cnt += 1
        }

        try {
            let res2 = DateTime.parse("2023/04/20/04 00:00:00 +00:00", "yyyy/MM/dd/MM HH:mm:ss OOOO")
        } catch (e2: TimeParseException) {
            @Expect(e2.message, "Extra month format.")
            cnt += 1
        }

        try {
            let res3 = DateTime.parse("2023/04/20/20 00:00:00 +00:00", "yyyy/MM/dd/dd HH:mm:ss OOOO")
        } catch (e3: TimeParseException) {
            @Expect(e3.message, "Extra dayOfMonth format.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/20 00:00:00:00 +00:00", "yyyy/MM/dd HH:mm:ss:HH OOOO")
        } catch (e4: TimeParseException) {
            @Expect(e4.message, "Extra hour format.")
            cnt += 1
        }

        try {
            let res5 = DateTime.parse("2023/04/20 00:00:00:00 +00:00", "yyyy/MM/dd HH:mm:ss:mm OOOO")
        } catch (e5: TimeParseException) {
            @Expect(e5.message, "Extra minute format.")
            cnt += 1
        }

        try {
            let res6 = DateTime.parse("2023/04/20 00:00:00:00 +00:00", "yyyy/MM/dd HH:mm:ss:ss OOOO")
        } catch (e6: TimeParseException) {
            @Expect(e6.message, "Extra second format.")
            cnt += 1
        }

        try {
            let res7 = DateTime.parse("2023/04/20 00:00:00 +00:00 +00:00", "yyyy/MM/dd HH:mm:ss OOOO OOOO")
        } catch (e7: TimeParseException) {
            @Expect(e7.message, "Extra zone offset format.")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("2023/04/20 00:00:00 Asia/Shanghai Asia/Shanghai", "yyyy/MM/dd HH:mm:ss zzzz zzzz")
        } catch (e8: TimeParseException) {
            @Expect(e8.message, "Extra zone id format.")
            cnt += 1
        }

        try {
            let res9 = DateTime.parse("2023/04/20 00:00:00 GMT+00:00:00 GMT+00:00:00", "yyyy/MM/dd HH:mm:ss ZZZZ ZZZZ")
        } catch (e9: TimeParseException) {
            @Expect(e9.message, "Extra zone offset format.")
            cnt += 1
        }

        try {
            let res10 = DateTime.parse("2023/01/01 00:00:00 001 001", "yyyy/MM/dd HH:mm:ss DD DD")
        } catch (e10: TimeParseException) {
            @Expect(e10.message, "Extra dayOfYear format.")
            cnt += 1
        }

        try {
            let res11 = DateTime.parse("2023/01/01 00:00:00 01 01", "yyyy/MM/dd HH:mm:ss WW WW")
        } catch (e11: TimeParseException) {
            @Expect(e11.message, "Extra isoWeek format.")
            cnt += 1
        }

        try {
            let res12 = DateTime.parse("2023/01/01 00:00:00 A A", "yyyy/MM/dd HH:mm:ss G G")
        } catch (e12: TimeParseException) {
            @Expect(e12.message, "Extra era value.")
            cnt += 1
        }

        try {
            let res13 = DateTime.parse("2023/01/01 00:00:00 AM AM", "yyyy/MM/dd HH:mm:ss a a")
        } catch (e13: TimeParseException) {
            @Expect(e13.message, "Extra AM/PM value.")
            cnt += 1
        }

        @Expect(cnt, 13)
    }
}
