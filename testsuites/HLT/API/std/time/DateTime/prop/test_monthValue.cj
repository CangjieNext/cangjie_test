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
class Test_monthValue {
    @TestCase
    func test_monthValue_01(): Unit {
        var count = 0
        var month: Month
        let monthValueArray: Array<Int64> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        let monthArray: Array<Month> = [January, February, March, April, May, June, July, August, September, October,
            November, December]
        for (i in 0..12) {
            month = DateTime
                .of(year: 999999999, month: monthArray[i], dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
                .month
            if (month == monthArray[i]) {
                count += 1
            }
        }
        @Assert(count, 12)
    }
}
