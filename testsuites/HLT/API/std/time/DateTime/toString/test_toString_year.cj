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
class Test_toString_year {
    @TestCase
    func test_toString_y(): Unit {
        let res1 = DateTime.UnixEpoch.format("y/MM/dd HH:mm:ss OOOO")
        let res2 = DateTime.UnixEpoch.format("yy/MM/dd HH:mm:ss OOOO")
        let res3 = DateTime.UnixEpoch.format("yyy/MM/dd HH:mm:ss OOOO")
        let res4 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss OOOO")
        let res5 = DateTime.UnixEpoch.format("yyyyy/MM/dd HH:mm:ss OOOO")
        let res6 = DateTime.UnixEpoch.format("yyyyyy/MM/dd HH:mm:ss OOOO")
        let res7 = DateTime.UnixEpoch.format("yyyyyyy/MM/dd HH:mm:ss OOOO")
        let res8 = DateTime.UnixEpoch.format("yyyyyyyy/MM/dd HH:mm:ss OOOO")
        let res9 = DateTime.UnixEpoch.format("yyyyyyyyy/MM/dd HH:mm:ss OOOO")
        @Expect(res1,"1970/01/01 00:00:00 Z")
        @Expect(res2,"70/01/01 00:00:00 Z")
        @Expect(res3,"1970/01/01 00:00:00 Z")
        @Expect(res4,"1970/01/01 00:00:00 Z")
        @Expect(res5,"01970/01/01 00:00:00 Z")
        @Expect(res6,"001970/01/01 00:00:00 Z")
        @Expect(res7,"0001970/01/01 00:00:00 Z")
        @Expect(res8,"00001970/01/01 00:00:00 Z")
        @Expect(res9,"000001970/01/01 00:00:00 Z")
    }

    @TestCase
    func test_toString_Y(): Unit {
        let res1 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss Y")
        let res2 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YY")
        let res3 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YYY")
        let res4 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YYYY")
        let res5 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YYYYY")
        let res6 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YYYYYY")
        let res7 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YYYYYYY")
        let res8 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YYYYYYYY")
        let res9 = DateTime.UnixEpoch.format("yyyy/MM/dd HH:mm:ss YYYYYYYYY")

        @Expect(res1,"1970/01/01 00:00:00 1970")
        @Expect(res2,"1970/01/01 00:00:00 70")
        @Expect(res3,"1970/01/01 00:00:00 1970")
        @Expect(res4,"1970/01/01 00:00:00 1970")
        @Expect(res5,"1970/01/01 00:00:00 01970")
        @Expect(res6,"1970/01/01 00:00:00 001970")
        @Expect(res7,"1970/01/01 00:00:00 0001970")
        @Expect(res8,"1970/01/01 00:00:00 00001970")
        @Expect(res9,"1970/01/01 00:00:00 000001970")
    }
}
