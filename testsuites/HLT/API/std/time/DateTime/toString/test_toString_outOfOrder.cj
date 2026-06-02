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
class Test_toString_outOfOrder {
    @TestCase
    func test_toString_outOfOrder(): Unit {
        let res = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("HH:mm:ss yyyy/MM/dd")
        @Expect(res, "01:02:03 2023/02/11")

        let res1 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/MM/dd HH:mm:ss")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/dd/MM HH:mm:ss")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("MM/yyyy/dd HH:mm:ss")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("MM/dd/yyyy HH:mm:ss")
        let res5 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("dd/yyyy/MM HH:mm:ss")
        let res6 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("dd/MM/yyyy HH:mm:ss")

        @Expect(res1, "2023/02/11 01:02:03")
        @Expect(res2, "2023/11/02 01:02:03")
        @Expect(res3, "02/2023/11 01:02:03")
        @Expect(res4, "02/11/2023 01:02:03")
        @Expect(res5, "11/2023/02 01:02:03")
        @Expect(res6, "11/02/2023 01:02:03")

        let res7 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/MM/dd HH:mm:ss")
        let res8 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/MM/dd HH:ss:mm")
        let res9 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/MM/dd mm:HH:ss")
        let res10 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/MM/dd mm:ss:HH")
        let res11 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/MM/dd ss:HH:mm")
        let res12 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 1, minute: 2, second: 3, nanosecond: 4)
            .format("yyyy/MM/dd ss:mm:HH")

        @Expect(res7, "2023/02/11 01:02:03")
        @Expect(res8, "2023/02/11 01:03:02")
        @Expect(res9, "2023/02/11 02:01:03")
        @Expect(res10, "2023/02/11 02:03:01")
        @Expect(res11, "2023/02/11 03:01:02")
        @Expect(res12, "2023/02/11 03:02:01")
    }
}
