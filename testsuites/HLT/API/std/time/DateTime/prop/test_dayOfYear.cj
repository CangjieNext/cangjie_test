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
class Test_dayOfYear {
    @TestCase
    func test_dayOfYear_01(): Unit {
        let res = DateTime.of(year: 2008, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 366)
    }

    @TestCase
    func test_dayOfYear_02(): Unit {
        let res = DateTime.of(year: 2000, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 366)
    }

    @TestCase
    func test_dayOfYear_03(): Unit {
        let res = DateTime.of(year: 1900, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 365)
    }

    @TestCase
    func test_dayOfYear_04(): Unit {
        let res = DateTime.of(year: 2023, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 365)
    }

    @TestCase
    func test_dayOfYear_05(): Unit {
        let res = DateTime.of(year: -2008, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 366)
    }

    @TestCase
    func test_dayOfYear_06(): Unit {
        let res = DateTime.of(year: -2000, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 366)
    }

    @TestCase
    func test_dayOfYear_07(): Unit {
        let res = DateTime.of(year: -1900, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 365)
    }

    @TestCase
    func test_dayOfYear_08(): Unit {
        let res = DateTime.of(year: -2023, month: 12, dayOfMonth: 31).dayOfYear
        @Assert(res, 365)
    }
}
