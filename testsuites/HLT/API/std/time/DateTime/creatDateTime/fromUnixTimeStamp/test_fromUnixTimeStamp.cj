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
class Test_fromUnixTimeStamp {
    @TestCase
    func test_fromUnixTimeStamp_01(): Unit {
        let d = Duration.Max
        try {
            DateTime.fromUnixTimeStamp(d)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func test_fromUnixTimeStamp_02(): Unit {
        let d = Duration.Min
        try {
            DateTime.fromUnixTimeStamp(d)
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func test_fromUnixTimeStamp_03(): Unit {
        let d = Duration.Zero
        let res = DateTime.fromUnixTimeStamp(d).toString()
        @Assert(res, "1970-01-01T00:00:00Z")
    }
}
