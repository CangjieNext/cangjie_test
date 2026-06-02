/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Test_toUnixTimeStamp {
    @TestCase
    func test_toUnixTimeStamp_01(): Unit {
        let res = DateTime.UnixEpoch.toUnixTimeStamp()
        @Assert(res.toString(),"0s")
    }

    @TestCase
    func test_toUnixTimeStamp_02(): Unit {
        try {
            (DateTime.UnixEpoch + Duration.Max).toUnixTimeStamp()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }

    @TestCase
    func test_toUnixTimeStamp_03(): Unit {
        try {
            (DateTime.UnixEpoch + Duration.Min).toUnixTimeStamp()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result of year is outside the range [-999,999,999, 999,999,999].")
        }
    }
}
