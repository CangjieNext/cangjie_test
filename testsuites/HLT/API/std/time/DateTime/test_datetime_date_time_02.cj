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

@Test
class Test_datetime_date_time_02 {
    @TestCase
    func test_datetime_date_time_01(): Unit {
        let tim = DateTime.of(year: 2008, month: February, dayOfMonth: 29, hour: 0, minute: 0, second: 0, nanosecond: 0)
        @Expect(tim.date[0], 2008)
        @Expect(tim.date[1], Month.February)
        @Expect(tim.date[2], 29)
    }

    @TestCase
    func test_datetime_date_time_02(): Unit {
        let tim = DateTime.of(year: 1969, month: February, dayOfMonth: 28, hour: 0, minute: 0, second: 0, nanosecond: 0)
        @Expect(tim.date[0], 1969)
        @Expect(tim.date[1], Month.February)
        @Expect(tim.date[2], 28)
    }

    @TestCase
    func test_datetime_date_time_03(): Unit {
        let tim = DateTime.of(year: 1969, month: February, dayOfMonth: 28, hour: 11, minute: 1, second: 3, nanosecond: 0)
        @Expect(tim.time[0], 11)
        @Expect(tim.time[1], 1)
        @Expect(tim.time[2], 3)
    }

    @TestCase
    func test_datetime_date_time_04(): Unit {
        let tim = DateTime.ofEpoch(second: 1, nanosecond: 3)
        @Expect(tim.time[0], 0)
        @Expect(tim.time[1], 0)
        @Expect(tim.time[2], 1)
    }
}
