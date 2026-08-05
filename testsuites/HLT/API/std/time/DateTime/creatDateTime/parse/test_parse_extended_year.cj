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
class Test_parse_extended_year {
    @TestCase
    func test_parse_extended_year(): Unit {
        let r1 = DateTime.parse("10000-01-01T00:00:00Z")
        @Expect(r1.year, 10000)

        let r2 = DateTime.parse("12345-01-01T00:00:00Z")
        @Expect(r2.year, 12345)

        let r3 = DateTime.parse("99999-01-01T00:00:00Z")
        @Expect(r3.year, 99999)

        let r4 = DateTime.parse("999999999-12-31T23:59:59.999999999Z")
        @Expect(r4.year, 999999999)

        let r5 = DateTime.parse("-10000-01-01T00:00:00Z")
        @Expect(r5.year, -10000)

        let r6 = DateTime.parse("-999999999-01-01T00:00:00Z")
        @Expect(r6.year, -999999999)
    }

    @TestCase
    func test_extended_year_roundtrip(): Unit {
        for (y in [10000, 12345, 99999, 999999999, -10000, -12345, -999999999]) {
            let d = DateTime.ofUTC(year: y, month: 1, dayOfMonth: 1)
            @Expect(DateTime.parse(d.toString()), d)
        }
    }

    @TestCase
    func test_short_year_still_rejected(): Unit {
        var thrown = false
        try {
            DateTime.parse("999-01-01T00:00:00Z")
        } catch (e: TimeParseException) {
            thrown = true
        }
        @Expect(thrown, true)
    }
}
