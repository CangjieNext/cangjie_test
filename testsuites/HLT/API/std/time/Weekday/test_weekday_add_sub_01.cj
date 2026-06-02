/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args 

import std.time.*
import std.math.*

@Test
class Test_weekday_add_01 {
    @TestCase
    func test_weekday_add_01(): Unit {
        @Expect(DayOfWeek.of(0) + 1, DayOfWeek.of(1))
        @Expect(DayOfWeek.of(6) + 1, DayOfWeek.of(0))
        @Expect(DayOfWeek.of(6) + Int64.Max, DayOfWeek.of(6))
        @Expect(DayOfWeek.of(6) - Int64.Max, DayOfWeek.of(6))
        @Expect(DayOfWeek.of(6) + (-1), DayOfWeek.of(5))
        @Expect(DayOfWeek.of(6) + (-10), DayOfWeek.of(3))
    }

    @TestCase
    func test_weekday_sub_02(): Unit {
        @Expect(DayOfWeek.of(0) - 1, DayOfWeek.of(6))
        @Expect(DayOfWeek.of(6) - 1, DayOfWeek.of(5))
        @Expect(DayOfWeek.of(6) - (-1), DayOfWeek.of(0))
        @Expect(DayOfWeek.of(6) - (-10), DayOfWeek.of(2))
    }

    @TestCase
    func test_weekday_mix_03(): Unit {
        @Expect(DayOfWeek.of(0) - 100000, DayOfWeek.of(2))
        @Expect(DayOfWeek.of(6) + 1000000, DayOfWeek.of(0))
        @Expect(DayOfWeek.of(0) - 10, DayOfWeek.of(4))
        @Expect(DayOfWeek.of(0) - 1, DayOfWeek.of(6))
    }
}
