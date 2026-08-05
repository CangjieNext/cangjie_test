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
class Test_toString_negative_year {
    @TestCase
    func test_negative_year_toString(): Unit {
        let d1 = DateTime.ofUTC(year: -1, month: 1, dayOfMonth: 2, hour: 3, minute: 4, second: 5)
        @Expect(d1.toString(), "-0001-01-02T03:04:05Z")

        let d2 = DateTime.ofUTC(year: -12, month: 6, dayOfMonth: 15)
        @Expect(d2.toString(), "-0012-06-15T00:00:00Z")

        let d3 = DateTime.ofUTC(year: -123, month: 2, dayOfMonth: 28)
        @Expect(d3.toString(), "-0123-02-28T00:00:00Z")

        let d4 = DateTime.ofUTC(year: -5, month: 6, dayOfMonth: 15)
        @Expect(d4.toString(), "-0005-06-15T00:00:00Z")

        let d5 = DateTime.ofUTC(year: 0, month: 1, dayOfMonth: 1)
        @Expect(d5.toString(), "0000-01-01T00:00:00Z")
    }

    @TestCase
    func test_negative_year_roundtrip(): Unit {
        for (y in [-1, -12, -123, -1234]) {
            let d = DateTime.ofUTC(year: y, month: 1, dayOfMonth: 1)
            @Expect(DateTime.parse(d.toString()), d)
        }
    }
}
