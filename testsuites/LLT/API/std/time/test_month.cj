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
import std.math.*

@Test
class MonthTest {
    @TestCase
    func printMonth(): Unit {
        @Expect(Month.of(1).toString(), "January")
        @Expect(Month.of(2).toString(), "February")
        @Expect(Month.of(3).toString(), "March")
        @Expect(Month.of(4).toString(), "April")
        @Expect(Month.of(5).toString(), "May")
        @Expect(Month.of(6).toString(), "June")
        @Expect(Month.of(7).toString(), "July")
        @Expect(Month.of(8).toString(), "August")
        @Expect(Month.of(9).toString(), "September")
        @Expect(Month.of(10).toString(), "October")
        @Expect(Month.of(11).toString(), "November")
        @Expect(Month.of(12).toString(), "December")

        try {
            Month.of(13)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter ranges from 1 to 12")
        }
    }

    @TestCase
    func getValue(): Unit {
        @Expect(January.value(), 1)
        @Expect(February.value(), 2)
        @Expect(March.value(), 3)
        @Expect(April.value(), 4)
        @Expect(May.value(), 5)
        @Expect(June.value(), 6)
        @Expect(July.value(), 7)
        @Expect(August.value(), 8)
        @Expect(September.value(), 9)
        @Expect(October.value(), 10)
        @Expect(November.value(), 11)
        @Expect(December.value(), 12)
    }

    @TestCase
    func compareMonth(): Unit {
        @Expect(Month.of(1) + 5 == Month.of(12) - 6)
        @Expect(Month.of(2) + 4 == Month.of(11) - 5)
        @Expect(Month.of(3) + 3 == Month.of(10) - 4)
        @Expect(Month.of(4) + 2 == Month.of(9) - 3)
        @Expect(Month.of(5) + 1 == Month.of(8) - 2)
        @Expect(Month.of(6) + 0 == Month.of(7) - 1)

        @Expect(January + 12 == January)
        @Expect(January + Int64.Min == May)
        @Expect(January - 12 == January)
        @Expect(February + 13 != February)
        @Expect(February + 13 == March)
        @Expect(June + Int64.Max == January)
        @Expect(November - 13 != November)
        @Expect(November - 13 == October)
        @Expect(November - Int64.Min == July)
        @Expect(December - 12 == December)
        @Expect(December + 12 == December)
        @Expect(December - Int64.Max == May)
    }
}
