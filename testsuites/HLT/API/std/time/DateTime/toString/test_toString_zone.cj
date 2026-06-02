/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0

// (Windows) DEPENDENCE: ../../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args
// (not Windows)RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@When[os != "Linux"]
let res_string = "2023/02/11 11:11:11 <+07>"
@When[os == "Linux"]
let res_string = "2023/02/11 11:11:11 +07"

@Test
class Test_toString_zone {
    @TestCase
    func test_toString_zone(): Unit {
        let timezone = TimeZone.load("Asia/Shanghai")
        let timezone1 = TimeZone.load("Asia/Novosibirsk")

        let res1 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss z")
        let res2 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss zz")
        let res3 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss zzz")
        let res4 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss zzzz")

        let res5 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss Z")
        let res6 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss ZZ")
        let res7 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss ZZZ")
        let res8 = DateTime
            .ofUTC(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789)
            .format("yyyy/MM/dd HH:mm:ss ZZZZ")

        let res9 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone1)
            .format("yyyy/MM/dd HH:mm:ss z")
        let res10 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone1)
            .format("yyyy/MM/dd HH:mm:ss zz")
        let res11 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone1)
            .format("yyyy/MM/dd HH:mm:ss zzz")
        let res12 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone1)
            .format("yyyy/MM/dd HH:mm:ss zzzz")

        let res13 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss z")
        let res14 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss zz")
        let res15 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss zzz")
        let res16 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss zzzz")

        let res17 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss Z")
        let res18 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss ZZ")
        let res19 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss ZZZ")
        let res20 = DateTime
            .of(year: 2023, month: 2, dayOfMonth: 11, hour: 11, minute: 11, second: 11, nanosecond: 123456789,
                timeZone: timezone)
            .format("yyyy/MM/dd HH:mm:ss ZZZZ")

        @Expect(res1,"2023/02/11 11:11:11 UTC")
        @Expect(res2,"2023/02/11 11:11:11 UTC")
        @Expect(res3,"2023/02/11 11:11:11 UTC")
        @Expect(res4,"2023/02/11 11:11:11 UTC")

        @Expect(res5,"2023/02/11 11:11:11 GMT+0")
        @Expect(res6,"2023/02/11 11:11:11 GMT+00:00")
        @Expect(res7,"2023/02/11 11:11:11 GMT+00:00:00")
        @Expect(res8,"2023/02/11 11:11:11 GMT+00:00")

        @Expect(res9, res_string)
        @Expect(res10, res_string)
        @Expect(res11, res_string)
        @Expect(res12,"2023/02/11 11:11:11 Asia/Novosibirsk")

        @Expect(res13,"2023/02/11 11:11:11 CST")
        @Expect(res14,"2023/02/11 11:11:11 CST")
        @Expect(res15,"2023/02/11 11:11:11 CST")
        @Expect(res16,"2023/02/11 11:11:11 Asia/Shanghai")

        @Expect(res17,"2023/02/11 11:11:11 GMT+8")
        @Expect(res18,"2023/02/11 11:11:11 GMT+08:00")
        @Expect(res19,"2023/02/11 11:11:11 GMT+08:00:00")
        @Expect(res20,"2023/02/11 11:11:11 GMT+08:00")
    }
}
