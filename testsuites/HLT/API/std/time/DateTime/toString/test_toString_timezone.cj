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
class Test_toString_timezone {
    @TestCase
    func test_toString_timezone(): Unit {
        let res1 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss O")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss OO")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss OOO")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res1,"2023/02/11 11:11:11 +00")
        @Expect(res2,"2023/02/11 11:11:11 +00:00")
        @Expect(res3,"2023/02/11 11:11:11 +00:00:00")
        @Expect(res4,"2023/02/11 11:11:11 Z")
    }
}
