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
class Test_toString_a {
    @TestCase
    func test_toString_a(): Unit {
        let res1 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss a")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 59, second: 59, nanosecond: 999999999)
            .format("yyyy/MM/dd HH:mm:ss a")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 12, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss a")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 23, minute: 59, second: 59, nanosecond: 999999999)
            .format("yyyy/MM/dd HH:mm:ss a")
        @Expect(res1,"2023/02/11 00:00:00 AM")
        @Expect(res2,"2023/02/11 11:59:59 AM")
        @Expect(res3,"2023/02/11 12:00:00 PM")
        @Expect(res4,"2023/02/11 23:59:59 PM")
    }
}
