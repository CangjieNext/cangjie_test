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
class Test_toString_w {
    @TestCase
    func test_toString_W(): Unit {
        let res1 = DateTime
            .ofUTC(year: 2023, month: 1, dayOfMonth: 8, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss W")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 1, dayOfMonth: 8, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss WW")
        @Expect(res1,"2023/01/08 11:11:11 1")
        @Expect(res2,"2023/01/08 11:11:11 01")
    }

    @TestCase
    func test_toString_w(): Unit {
        let res1 = DateTime
            .ofUTC(year: 2023, month: 4, dayOfMonth: 21, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss w")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 4, dayOfMonth: 21, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss ww")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 4, dayOfMonth: 21, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss www")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 4, dayOfMonth: 21, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss wwww")
        @Expect(res1,"2023/04/21 11:11:11 5")
        @Expect(res2,"2023/04/21 11:11:11 05")
        @Expect(res3,"2023/04/21 11:11:11 Fri")
        @Expect(res4,"2023/04/21 11:11:11 Friday")
    }
}
