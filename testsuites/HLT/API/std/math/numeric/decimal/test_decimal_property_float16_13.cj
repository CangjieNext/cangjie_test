/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.math.numeric.*
import std.math.*
import std.collection.*

@Test
class Test_decimal_property_float16_13 {
    @TestCase
    func test_decimal_float16_01(): Unit {
        let dec = Decimal(0.123456789f32)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("12345679104328155517578125"))
        @Expect(dec.scale, 26)
        @Expect(dec.precision, 26)
        @Expect(dec.toString(), "0.12345679104328155517578125")
    }

    @TestCase
    func test_decimal_float16_02(): Unit {
        let dec = Decimal(0.1f16)
        println(dec)
        @Expect(dec.sign, 1)
        @Expect(dec.value, BigInt("999755859375"))
        @Expect(dec.scale, 13)
        @Expect(dec.precision, 12)
        @Expect(dec.toString(), "0.0999755859375")
    }
}
