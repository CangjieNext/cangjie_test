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
class Test_parse {
    @TestCase
    func test_parse_01(): Unit {
        let res = DateTime.parse("9999-12-31T23:59:59+00:00").toString()
        @Assert(res, "9999-12-31T23:59:59Z")
    }

    @TestCase
    func test_parse_02(): Unit {
        let res = DateTime.parse("-9999-01-01T00:00:00+00:00").toString()
        @Assert(res, "-9999-01-01T00:00:00Z")
    }

    @TestCase
    func test_parse_03(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-13-10T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid month value: expected 1 to 12.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_04(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-00-10T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid month value: expected 1 to 12.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_05(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-02-30T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '30' for February 0: expected 1 to 29.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_06(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-02-00T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '0' for February 0: expected 1 to 29.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_07(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-01-32T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '32' for January 0: expected 1 to 31.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_08(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-01-00T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '0' for January 0: expected 1 to 31.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_09(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-04-31T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '31' for April 0: expected 1 to 30.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_10(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("0000-04-00T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '0' for April 0: expected 1 to 30.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_11(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-29T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '29' for February 2023: expected 1 to 28.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_12(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-00T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid day '0' for February 2023: expected 1 to 28.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_13(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-28T24:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid hour in 'HH' format: expected 0 to 23.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_14(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-28T-01:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 11: expected an integer, got '-'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_15(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-28T00:60:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid minute value: expected 0 to 59.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_16(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-28T00:-01:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 14: expected an integer, got '-'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_17(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-28T00:00:60+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid second value: expected 0 to 59.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_18(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-02-28T00:00:-01+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 17: expected an integer, got '-'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_19(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("202304-17T15:32:00+00:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 4: expected '-', got '0'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_20(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-0417T15:32:00+00:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 7: expected '-', got '1'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_21(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-04-1715:32:00+00:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 10: expected 'T', got '1'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_22(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-04-17T1532:00+00:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 13: expected ':', got '3'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_23(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-04-17T15:3200+00:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 16: expected ':', got '0'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_24(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-04-17T15:32:0000:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid zone offset value.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_25(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-04-17T15:32:00+0000").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Invalid zone offset value.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_26(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("10000-04-10T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 4: expected '-', got '0'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_27(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-10000-04-10T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 5: expected '-', got '0'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_28(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-4-10T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 6: expected an integer, got '-'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_29(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-1000-012-10T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 8: expected '-', got '2'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_30(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-04-010T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 10: expected 'T', got '0'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_31(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-1000-02-012T08:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 11: expected 'T', got '2'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_32(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-04-10T8:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 12: expected an integer, got ':'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_33(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-1000-02-12T008:00:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 14: expected ':', got '8'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_34(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-04-10T08:001:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 16: expected ':', got '1'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_35(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-1000-02-12T08:0:00+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 16: expected an integer, got ':'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_36(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-04-10T08:01:001+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Zone offset must start with '+' or '-'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_37(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-1000-02-12T08:00:1+08:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 19: expected an integer, got '+'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_38(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-04-10T08:01:01+008:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 22: expected ':', got '8'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_39(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-1000-02-12T08:00:1+8:00").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 19: expected an integer, got '+'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_40(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-04-10T08:01:01+08:008").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Extra value starting at index 25.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_41(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("-1000-02-12T08:00:1+08:8").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 19: expected an integer, got '+'.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_42(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("2023-04-17T15:32:00+00:000").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Extra value starting at index 25.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_parse_43(): Unit {
        var flag = false
        try {
            let res = DateTime.parse("1000-04-10T08:01:01+008:0").toString()
        } catch (e: TimeParseException) {
            flag = true
            @Expect(e.message, "Failed to parse at index 22: expected ':', got '8'.")
        }
        @Expect(flag, true)
    }
}
