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
class Test_parse_year {
    @TestCase
    func test_parse_with_format_01(): Unit {
        let res = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res.toString(),"2023-04-17T19:52:23Z")
    }

    @TestCase
    func test_year_y(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00", "y/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-2023/04/17 19:52:23 +00:00", "y/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("202/04/17 19:52:23 +00:00", "y/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 3: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("20232/04/17 19:52:23 +00:00", "y/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 4: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y2(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("68/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("69/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        let res3 = DateTime.parse("70/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        let res4 = DateTime.parse("-68/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        let res5 = DateTime.parse("-69/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        let res6 = DateTime.parse("-70/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        @Expect(res1.toString(),"2068-04-17T19:52:23Z")
        @Expect(res2.toString(),"1969-04-17T19:52:23Z")
        @Expect(res3.toString(),"1970-04-17T19:52:23Z")
        @Expect(res4.toString(),"-2068-04-17T19:52:23Z")
        @Expect(res5.toString(),"-1969-04-17T19:52:23Z")
        @Expect(res6.toString(),"-1970-04-17T19:52:23Z")

        try {
            let res7 = DateTime.parse("167/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 2: \"7\" should be \"/\".")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("7/04/17 19:52:23 +00:00", "yy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 1: \"/\" should be integer.")
            cnt += 1
        }

        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y3(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-2023/04/17 19:52:23 +00:00", "yyy/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("202/04/17 19:52:23 +00:00", "yyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 3: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("20232/04/17 19:52:23 +00:00", "yyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 4: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y4(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-2023/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("202/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 3: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("20232/04/17 19:52:23 +00:00", "yyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 4: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y5(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("12023/04/17 19:52:23 +00:00", "yyyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-12023/04/17 19:52:23 +00:00", "yyyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"12023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-12023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2022/04/17 19:52:23 +00:00", "yyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 4: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("120232/04/17 19:52:23 +00:00", "yyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 5: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y6(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("112023/04/17 19:52:23 +00:00", "yyyyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-112023/04/17 19:52:23 +00:00", "yyyyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("12022/04/17 19:52:23 +00:00", "yyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 5: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("1120232/04/17 19:52:23 +00:00", "yyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 6: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y7(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("1112023/04/17 19:52:23 +00:00", "yyyyyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-1112023/04/17 19:52:23 +00:00", "yyyyyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"1112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-1112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("112022/04/17 19:52:23 +00:00", "yyyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 6: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("11120232/04/17 19:52:23 +00:00", "yyyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 7: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y8(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("11112023/04/17 19:52:23 +00:00", "yyyyyyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-11112023/04/17 19:52:23 +00:00", "yyyyyyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"11112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-11112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("1112022/04/17 19:52:23 +00:00", "yyyyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 7: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("111120232/04/17 19:52:23 +00:00", "yyyyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 8: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_y9(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("111112023/04/17 19:52:23 +00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.parse("-111112023/04/17 19:52:23 +00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOOO")
        @Assert(res1.toString(),"111112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-111112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("11112022/04/17 19:52:23 +00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 8: \"/\" should be integer.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("1111120232/04/17 19:52:23 +00:00", "yyyyyyyyy/MM/dd HH:mm:ss OOOO")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 9: \"2\" should be \"/\".")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00 2023", "yyyy/MM/dd HH:mm:ss OOOO Y")
        let res2 = DateTime.parse("-2023/04/17 19:52:23 +00:00 -2023", "yyyy/MM/dd HH:mm:ss OOOO Y")
        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +00:00 2022", "yyyy/MM/dd HH:mm:ss OOOO Y")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The year based on ISO8601 does not match.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 2024", "yyyy/MM/dd HH:mm:ss OOOO Y")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The year based on ISO8601 does not match.")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y2(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2068/04/17 19:52:23 +00:00 68", "yyyy/MM/dd HH:mm:ss OOOO YY")
        let res2 = DateTime.parse("1969/04/17 19:52:23 +00:00 69", "yyyy/MM/dd HH:mm:ss OOOO YY")
        let res3 = DateTime.parse("1970/04/17 19:52:23 +00:00 70", "yyyy/MM/dd HH:mm:ss OOOO YY")
        let res4 = DateTime.parse("-2068/04/17 19:52:23 +00:00 -68", "yyyy/MM/dd HH:mm:ss OOOO YY")
        let res5 = DateTime.parse("-1969/04/17 19:52:23 +00:00 -69", "yyyy/MM/dd HH:mm:ss OOOO YY")
        let res6 = DateTime.parse("-1970/04/17 19:52:23 +00:00 -70", "yyyy/MM/dd HH:mm:ss OOOO YY")
        @Expect(res1.toString(),"2068-04-17T19:52:23Z")
        @Expect(res2.toString(),"1969-04-17T19:52:23Z")
        @Expect(res3.toString(),"1970-04-17T19:52:23Z")
        @Expect(res4.toString(),"-2068-04-17T19:52:23Z")
        @Expect(res5.toString(),"-1969-04-17T19:52:23Z")
        @Expect(res6.toString(),"-1970-04-17T19:52:23Z")

        try {
            let res7 = DateTime.parse("2068/04/17 19:52:23 +00:00 69", "yyyy/MM/dd HH:mm:ss OOOO YY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The year based on ISO8601 does not match.")
            cnt += 1
        }

        try {
            let res8 = DateTime.parse("1970/04/17 19:52:23 +00:00 69", "yyyy/MM/dd HH:mm:ss OOOO YY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "The year based on ISO8601 does not match.")
            cnt += 1
        }

        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y3(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00 2023", "yyyy/MM/dd HH:mm:ss OOOO YYY")
        let res2 = DateTime.parse("-2023/04/17 19:52:23 +00:00 -2023", "yyyy/MM/dd HH:mm:ss OOOO YYY")
        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +00:00 202", "yyyy/MM/dd HH:mm:ss OOOO YYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 20", "yyyy/MM/dd HH:mm:ss OOOO YYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 SS", "yyyy/MM/dd HH:mm:ss OOOO YYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: year value is not correct.")
            cnt += 1
        }
        @Expect(cnt, 3)
    }

    @TestCase
    func test_year_Y4(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("2023/04/17 19:52:23 +00:00 2023", "yyyy/MM/dd HH:mm:ss OOOO YYYY")
        let res2 = DateTime.parse("-2023/04/17 19:52:23 +00:00 -2023", "yyyy/MM/dd HH:mm:ss OOOO YYYY")
        @Assert(res1.toString(),"2023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-2023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("2023/04/17 19:52:23 +00:00 202", "yyyy/MM/dd HH:mm:ss OOOO YYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 27: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("2023/04/17 19:52:23 +00:00 20232", "yyyy/MM/dd HH:mm:ss OOOO YYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 31.")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y5(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("12023/04/17 19:52:23 +00:00 12023", "yyyyy/MM/dd HH:mm:ss OOOO YYYYY")
        let res2 = DateTime.parse("-12023/04/17 19:52:23 +00:00 -12023", "yyyyy/MM/dd HH:mm:ss OOOO YYYYY")
        @Assert(res1.toString(),"12023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-12023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("12022/04/17 19:52:23 +00:00 2022", "yyyyy/MM/dd HH:mm:ss OOOO YYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 28: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("12023/04/17 19:52:23 +00:00 120230", "YYYYY/MM/dd HH:mm:ss YYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extra year format.")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y6(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("112023/04/17 19:52:23 +00:00 112023", "yyyyyy/MM/dd HH:mm:ss OOOO YYYYYY")
        let res2 = DateTime.parse("-112023/04/17 19:52:23 +00:00 -112023", "yyyyyy/MM/dd HH:mm:ss OOOO YYYYYY")
        @Assert(res1.toString(),"112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("112022/04/17 19:52:23 +00:00 12022", "yyyyyy/MM/dd HH:mm:ss OOOO YYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 29: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("112023/04/17 19:52:23 +00:00 1120231", "yyyyyy/MM/dd HH:mm:ss OOOO YYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 35.")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y7(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("1112023/04/17 19:52:23 +00:00 1112023", "yyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYY")
        let res2 = DateTime.parse("-1112023/04/17 19:52:23 +00:00 -1112023", "yyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYY")
        @Assert(res1.toString(),"1112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-1112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("1112022/04/17 19:52:23 +00:00 112022", "yyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 30: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("1120232/04/17 19:52:23 +00:00 11120232", "yyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 37.")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y8(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("11112023/04/17 19:52:23 +00:00 11112023", "yyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYY")
        let res2 = DateTime.parse("-11112023/04/17 19:52:23 +00:00 -11112023", "yyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYY")
        @Assert(res1.toString(),"11112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-11112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("11112022/04/17 19:52:23 +00:00 1111202", "yyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 31: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("11120232/04/17 19:52:23 +00:00 111120232",
                "yyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 39.")
            cnt += 1
        }
        @Expect(cnt, 2)
    }

    @TestCase
    func test_year_Y9(): Unit {
        var cnt = 0
        let res1 = DateTime.parse("111112023/04/17 19:52:23 +00:00 111112023", "yyyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYYY")
        let res2 = DateTime.parse("-111112023/04/17 19:52:23 +00:00 -111112023",
            "yyyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYYY")
        @Assert(res1.toString(),"111112023-04-17T19:52:23Z")
        @Assert(res2.toString(),"-111112023-04-17T19:52:23Z")

        try {
            let res3 = DateTime.parse("111112022/04/17 19:52:23 +00:00 11112022",
                "yyyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Fail to parse at index 32: year value is not correct.")
            cnt += 1
        }

        try {
            let res4 = DateTime.parse("111120232/04/17 19:52:23 +00:00 1111120232",
                "yyyyyyyyy/MM/dd HH:mm:ss OOOO YYYYYYYYY")
        } catch (e: TimeParseException) {
            @Expect(e.message, "Extar value, start at index 41.")
            cnt += 1
        }
        @Expect(cnt, 2)
    }
}
