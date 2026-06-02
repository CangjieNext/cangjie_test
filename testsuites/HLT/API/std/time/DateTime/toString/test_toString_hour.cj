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
class Test_toString_hour {
    @TestCase
    func test_toString_H(): Unit {
        let res1 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd H:mm:ss OOOO")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd H:mm:ss OOOO")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 13, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd H:mm:ss OOOO")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss OOOO")
        let res5 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss OOOO")
        let res6 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 13, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss OOOO")
        let res7 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd H:mm:ss OOOO")
        let res8 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res1,"2023/02/11 1:00:00 Z")
        @Expect(res2,"2023/02/11 11:00:00 Z")
        @Expect(res3,"2023/02/11 13:00:00 Z")
        @Expect(res4,"2023/02/11 01:00:00 Z")
        @Expect(res5,"2023/02/11 11:00:00 Z")
        @Expect(res6,"2023/02/11 13:00:00 Z")
        @Expect(res7,"2023/02/11 0:00:00 Z")
        @Expect(res8,"2023/02/11 00:00:00 Z")
    }

    @TestCase
    func test_toString_h(): Unit {
        let res1 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd h:mm:ss OOOO")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd h:mm:ss OOOO")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 13, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd h:mm:ss OOOO")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd hh:mm:ss OOOO")
        let res5 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd hh:mm:ss OOOO")
        let res6 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 13, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd hh:mm:ss OOOO")
        let res7 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd h:mm:ss OOOO")
        let res8 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 0, minute: 0, second: 0, nanosecond: 0)
            .format("yyyy/MM/dd hh:mm:ss OOOO")
        @Expect(res1,"2023/02/11 1:00:00 Z")
        @Expect(res2,"2023/02/11 11:00:00 Z")
        @Expect(res3,"2023/02/11 1:00:00 Z")
        @Expect(res4,"2023/02/11 01:00:00 Z")
        @Expect(res5,"2023/02/11 11:00:00 Z")
        @Expect(res6,"2023/02/11 01:00:00 Z")
        @Expect(res7,"2023/02/11 12:00:00 Z")
        @Expect(res8,"2023/02/11 12:00:00 Z")
    }
}
