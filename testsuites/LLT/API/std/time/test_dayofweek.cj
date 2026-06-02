/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.time.*

@Test
class DayofWeekTest {
    @TestCase
    func printDayOfWeek(): Unit {
        @Expect(DayOfWeek.of(0).toString(), "Sunday")
        @Expect(DayOfWeek.of(1).toString(), "Monday")
        @Expect(DayOfWeek.of(2).toString(), "Tuesday")
        @Expect(DayOfWeek.of(3).toString(), "Wednesday")
        @Expect(DayOfWeek.of(4).toString(), "Thursday")
        @Expect(DayOfWeek.of(5).toString(), "Friday")
        @Expect(DayOfWeek.of(6).toString(), "Saturday")
        @Expect(DayOfWeek.of(6) + 1, DayOfWeek.of(0))
        @Expect(DayOfWeek.of(0) - 10, DayOfWeek.of(4))
        @Expect(DayOfWeek.of(6) + Int64.Max, DayOfWeek.of(6))
        @Expect(DayOfWeek.of(0) - Int64.Max, DayOfWeek.of(0))
        @Expect(DayOfWeek.of(0) - 18, DayOfWeek.of(3))
        @Expect(DayOfWeek.of(0) - 0, DayOfWeek.of(0))
        try {
            DayOfWeek.of(7)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter ranges from 0 to 6")
        }
    }

    @TestCase
    func getValue(): Unit {
        @Expect(Sunday.value(), 0)
        @Expect(Monday.value(), 1)
        @Expect(Tuesday.value(), 2)
        @Expect(Wednesday.value(), 3)
        @Expect(Thursday.value(), 4)
        @Expect(Friday.value(), 5)
        @Expect(Saturday.value(), 6)
    }

    @TestCase
    func compareDayOfWeek(): Unit {
        @Expect(Sunday == Sunday)
        @Expect(Monday != Sunday)
    }
}
