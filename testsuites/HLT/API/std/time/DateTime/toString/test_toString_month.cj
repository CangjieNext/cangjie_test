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
class Test_toString_month {
    @TestCase
    func test_toString_month(): Unit {
        let res1 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/M/dd HH:mm:ss OOOO")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 12, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/M/dd HH:mm:ss OOOO")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss OOOO")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 12, dayOfMonth: 1, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res1,"2023/2/01 00:00:00 Z")
        @Expect(res2,"2023/12/01 00:00:00 Z")
        @Expect(res3,"2023/02/01 00:00:00 Z")
        @Expect(res4,"2023/12/01 00:00:00 Z")
    }
}
