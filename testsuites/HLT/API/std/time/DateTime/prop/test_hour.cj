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
class Test_hour {
    @TestCase
    func test_hour_01(): Unit {
        var hour = -1
        var count = 0
        for (i in 0..24) {
            hour = DateTime.of(year: 999999999, month: 1, dayOfMonth: 1, hour: i).hour
            if (hour == i) {
                count += 1
            }
        }
        @Assert(count, 24)
    }

    @TestCase
    func test_hour_02(): Unit {
        var hour = -1
        var count = 0
        for (i in 0..24) {
            hour = DateTime.of(year: -99999999, month: 1, dayOfMonth: 1, hour: i).hour
            if (hour == i) {
                count += 1
            }
        }
        @Assert(count, 24)
    }
}
