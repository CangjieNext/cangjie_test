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
class Test_parse_offset {
    @TestCase
    func test_parse_offset_O(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +25", "yyyy/MM/dd HH:mm:ss O")
        let res2 = DateTime.parse("2023/04/17 19:52:23 -24", "yyyy/MM/dd HH:mm:ss O")
        @Expect(res1.toString(), "2023-04-17T19:52:23+25:00")
        @Expect(res2.toString(), "2023-04-17T19:52:23-24:00")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +26", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "The hour in offset should be in [-24, 25].")
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 -25", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "The hour in offset should be in [-24, 25].")
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 +0", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:52:23 -0", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:52:23 00", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19:52:23 SS", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res9 = DateTime.parse("999999999/12/31 23:59:59 -20", "yyyyyyyyy/MM/dd HH:mm:ss O")
            let res9_inutc = res9.inUTC()
        } catch (e: ArithmeticException) {
            cnt += 1
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res10 = DateTime.parse("-999999999/01/01 00:00:00 +20", "yyyyyyyyy/MM/dd HH:mm:ss O")
            let res10_inutc = res10.inUTC()
        } catch (e: ArithmeticException) {
            cnt += 1
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res11 = DateTime.parse("2023/04/17 19:52:23 +000", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Extar value, start at index 23.")
        }

        try {
            let res12 = DateTime.parse("2023/04/17 19:52:23 +", "yyyy/MM/dd HH:mm:ss O")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        @Expect(cnt, 10)
    }

    @TestCase
    func test_parse_offset_OO(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +25:59", "yyyy/MM/dd HH:mm:ss OO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 -24:59", "yyyy/MM/dd HH:mm:ss OO")
        @Expect(res1.toString(), "2023-04-17T19:52:23+25:59")
        @Expect(res2.toString(), "2023-04-17T19:52:23-24:59")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +25:60", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "The minute or second in offset should be in [0, 59].")
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 -24:-1", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Fail to parse at index 24: \"-\" should be integer.")
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 +0:00", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:52:23 -0:00", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:52:23 00:00", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19:52:23 SS:00", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res9 = DateTime.parse("999999999/12/31 23:59:59 -20:00", "yyyyyyyyy/MM/dd HH:mm:ss OO")
            let res9_inutc = res9.inUTC()
        } catch (e: ArithmeticException) {
            cnt += 1
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res10 = DateTime.parse("-999999999/01/01 00:00:00 +20:00", "yyyyyyyyy/MM/dd HH:mm:ss OO")
            let res10_inutc = res10.inUTC()
        } catch (e: ArithmeticException) {
            cnt += 1
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res11 = DateTime.parse("2023/04/17 19:52:23 +000:00", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Fail to parse at index 23: \"0\" should be \":\".")
        }

        try {
            let res12 = DateTime.parse("2023/04/17 19:52:23 +:00", "yyyy/MM/dd HH:mm:ss OO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }
    }

    @TestCase
    func test_parse_offset_OOO(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +25:59:59", "yyyy/MM/dd HH:mm:ss OOO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 -24:59:59", "yyyy/MM/dd HH:mm:ss OOO")
        @Expect(res1.toString(), "2023-04-17T19:52:23+25:59:59")
        @Expect(res2.toString(), "2023-04-17T19:52:23-24:59:59")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +25:59:60", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "The minute or second in offset should be in [0, 59].")
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 -24:00:-1", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Fail to parse at index 27: \"-\" should be integer.")
        }

        try {
            let res5 = DateTime.parse("2023/04/17 19:52:23 +0:00:00", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res6 = DateTime.parse("2023/04/17 19:52:23 -0:00:00", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:52:23 00:00:00", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19:52:23 SS:00:00", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }

        try {
            let res9 = DateTime.parse("999999999/12/31 23:59:59 -20:00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOO")
            let res9_inutc = res9.inUTC()
        } catch (e: ArithmeticException) {
            cnt += 1
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res10 = DateTime.parse("-999999999/01/01 00:00:00 +20:00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOO")
            let res10_inutc = res10.inUTC()
        } catch (e: ArithmeticException) {
            cnt += 1
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res11 = DateTime.parse("2023/04/17 19:52:23 +000:00:00", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Fail to parse at index 23: \"0\" should be \":\".")
        }

        try {
            let res12 = DateTime.parse("2023/04/17 19:52:23 +:00:00", "yyyy/MM/dd HH:mm:ss OOO")
        } catch (e: TimeParseException) {
            cnt += 1
            @Expect(e.message, "Illegal zone offset value.")
        }
    }

    @TestCase
    func test_parse_offset_OOOO(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +25:59", "yyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("2023/04/17 19:52:23 -24:59", "yyyy/MM/dd HH:mm:ss OOOO")
        let res3 = DateTime.parse("2023/04/17 19:52:23 +25:59:59", "yyyy/MM/dd HH:mm:ss OOOO")
        let res4 = DateTime.parse("2023/04/17 19:52:23 -24:59:59", "yyyy/MM/dd HH:mm:ss OOOO")
        let res5 = DateTime.parse("2023/04/17 19:52:23 Z", "yyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res1.toString(), "2023-04-17T19:52:23+25:59")
        @Expect(res2.toString(), "2023-04-17T19:52:23-24:59")
        @Expect(res3.toString(), "2023-04-17T19:52:23+25:59:59")
        @Expect(res4.toString(), "2023-04-17T19:52:23-24:59:59")
        @Expect(res5.toString(), "2023-04-17T19:52:23Z")

        try {
            let res6 = DateTime.parse("2023/04/17 19:52:23 +25:59:60", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e6: TimeParseException) {
            cnt += 1
            @Expect(e6.message, "The minute or second in offset should be in [0, 59].")
        }

        try {
            let res7 = DateTime.parse("2023/04/17 19:52:23 -24:00:-1", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e7: TimeParseException) {
            cnt += 1
            @Expect(e7.message, "Extar value, start at index 26.")
        }

        try {
            let res8 = DateTime.parse("2023/04/17 19:52:23 +0:00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e8: TimeParseException) {
            cnt += 1
            @Expect(e8.message, "Fail to parse at index 22: \":\" should be integer.")
        }

        try {
            let res9 = DateTime.parse("2023/04/17 19:52:23 -0:00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e9: TimeParseException) {
            cnt += 1
            @Expect(e9.message, "Fail to parse at index 22: \":\" should be integer.")
        }

        try {
            let res10 = DateTime.parse("2023/04/17 19:52:23 00:00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e10: TimeParseException) {
            cnt += 1
            @Expect(e10.message, "Zone offset should start with \"+\" or \"-\".")
        }

        try {
            let res11 = DateTime.parse("2023/04/17 19:52:23 SS:00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e11: TimeParseException) {
            cnt += 1
            @Expect(e11.message, "Zone offset should start with \"+\" or \"-\".")
        }

        try {
            let res12 = DateTime.parse("999999999/12/31 23:59:59 -20:00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOOO")
            let res12_inutc = res12.inUTC()
        } catch (e12: ArithmeticException) {
            cnt += 1
            @Expect(e12.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res13 = DateTime.parse("-999999999/01/01 00:00:00 +20:00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOOO")
            let res13_inutc = res13.inUTC()
        } catch (e13: ArithmeticException) {
            cnt += 1
            @Expect(e13.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }

        try {
            let res14 = DateTime.parse("2023/04/17 19:52:23 +000:00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e14: TimeParseException) {
            cnt += 1
            @Expect(e14.message, "Fail to parse at index 23: \"0\" should be \":\".")
        }

        try {
            let res15 = DateTime.parse("2023/04/17 19:52:23 +:00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e15: TimeParseException) {
            cnt += 1
            @Expect(e15.message, "Fail to parse at index 21: \":\" should be integer.")
        }

        @Expect(cnt, 10)
    }
}
