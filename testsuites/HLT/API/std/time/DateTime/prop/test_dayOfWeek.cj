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
class Test_dayOfWeek {
    @TestCase
    func test_dayOfWeek_01(): Unit {
        let arrayOfWeek: Array<DayOfWeek> = [Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday]
        let todayOfWeek = DateTime.now().dayOfWeek
        var indexOfToday: Int64 = -1
        var checkWeek: DayOfWeek
        var count: Int64 = 0
        var num: Int64
        for (i in 0..7) {
            if (todayOfWeek == arrayOfWeek[i]) {
                indexOfToday = i
            }
        }
        for (j in -7..8) {
            num = indexOfToday + j
            if (num > 6) {
                num -= 7
            }
            if (num < 0) {
                num += 7
            }
            checkWeek = DateTime.now().addDays(j).dayOfWeek
            if (checkWeek == arrayOfWeek[num]) {
                count += 1
            }
        }
        @Assert(count, 15)
    }
}
