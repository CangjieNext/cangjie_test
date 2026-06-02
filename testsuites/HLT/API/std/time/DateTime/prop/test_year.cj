/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Test_year {
    @TestCase
    func test_year_01(): Unit {
        let time = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
        let res = time.year
        @Assert(res, 999999999)
    }

    @TestCase
    func test_year_02(): Unit {
        let time = DateTime.of(year: -999999999, month: 1, dayOfMonth: 1, hour: 9, minute: 0, second: 0, nanosecond: 0)
        let res = time.year
        @Assert(res, -999999999)
    }
}
