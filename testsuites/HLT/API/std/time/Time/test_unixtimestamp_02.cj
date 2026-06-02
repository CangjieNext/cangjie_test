/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_UnixTimeStamp_02 {
    //nanosec - Int64.Min -9223 372 036 854 775 808
    @TestCase
    func case9(): Unit {
        var time1 = DateTime.ofEpoch(second: -9223372037, nanosecond: 145224192)
        var durNano = time1.toUnixTimeStamp().toNanoseconds()
        var durMicro = time1.toUnixTimeStamp().toMicroseconds()
        var durMilli = time1.toUnixTimeStamp().toMilliseconds()
        var durSec = time1.toUnixTimeStamp().toSeconds()
        @Expect(durNano, -9223372036854775808)
        @Expect(durMicro, -9223372036854775)
        @Expect(durMilli, -9223372036854)
        @Expect(durSec, -9223372036)
    }

    //nanosec - Int64.Min-1 -9223 372 036 854 775 809
    @TestCase
    func case10(): Unit {
        var time1 = DateTime.ofEpoch(second: -9223372037, nanosecond: 145224191)
        try {
            time1.toUnixTimeStamp().toNanoseconds()
            @Expect(1, 2)
        } catch (e: ArithmeticException) {
        }
    }
}
