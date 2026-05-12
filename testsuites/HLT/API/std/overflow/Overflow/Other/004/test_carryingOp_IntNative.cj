/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.overflow.*
import std.math.*

var intnative_1: IntNative = IntNative.Min
var intnative_2: IntNative = IntNative.Max
var intnative_3: IntNative = 10000

@Test
class Test_carryingOp_IntNative {
    @TestCase
    func test_intnative_carryingAdd(): Unit {
        let add = intnative_1.carryingAdd(intnative_2)
        @Expect(add[0],false)
        @Expect(add[1],-1)
        let add1 = intnative_2.carryingAdd(1)
        @Expect(add1[0],true)
        @Expect(add1[1],-9223372036854775808)
    }

    @TestCase
    func test_intnative_carryingSub(): Unit {
        let sub = intnative_2.carryingSub(1)
        @Expect(sub[0],false)
        @Expect(sub[1],9223372036854775806)
        let sub1 = intnative_1.carryingSub(1)
        @Expect(sub1[0],true)
        @Expect(sub1[1],9223372036854775807)
    }

    @TestCase
    func test_intnative_carryingMul(): Unit {
        let mul = intnative_2.carryingMul(0)
        @Expect(mul[0],false)
        @Expect(mul[1],0)
        let mul1 = intnative_1.carryingMul(2)
        @Expect(mul1[0],true)
        @Expect(mul1[1],0)
    }

    @TestCase
    func test_intnative_carryingDiv(): Unit {
        let div = intnative_1.carryingDiv(2)
        @Expect(div[0],false)
        @Expect(div[1],-4611686018427387904)
        let div1 = intnative_1.carryingDiv(-2)
        @Expect(div1[0],false)
        @Expect(div1[1],4611686018427387904)
        let div2 = intnative_2.carryingDiv(2)
        @Expect(div2[0],false)
        @Expect(div2[1],4611686018427387903)
    }

    @TestCase
    func test_intnative_carryingMod(): Unit {
        let div = intnative_1.carryingMod(intnative_2)
        @Expect(div[0],false)
        @Expect(div[1],-1)
        let div1 = intnative_1.carryingMod(1)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        try {
            intnative_1.carryingMod(0)
        } catch (e: ArithmeticException) {
            @Expect(e.toString(),"ArithmeticException: Divided by zero!")
        }
    }

    @TestCase
    func test_intnative_carryingInc(): Unit {
        let Inc = intnative_1.carryingInc()
        @Expect(Inc[0],false)
        @Expect(Inc[1],-9223372036854775807)
        let Inc1 = intnative_2.carryingInc()
        @Expect(Inc1[0],true)
        @Expect(Inc1[1],-9223372036854775808)
    }

    @TestCase
    func test_intnative_carryingDec(): Unit {
        let dec = intnative_1.carryingDec()
        @Expect(dec[0],true)
        @Expect(dec[1],9223372036854775807)
        let dec1 = intnative_2.carryingDec()
        @Expect(dec1[0],false)
        @Expect(dec1[1],9223372036854775806)
    }

    @TestCase
    func test_intnative_carryingNeg(): Unit {
        let dec = intnative_1.carryingNeg()
        @Expect(dec[0],true)
        @Expect(dec[1],-9223372036854775808)
        let dec1 = intnative_2.carryingNeg()
        @Expect(dec1[0],false)
        @Expect(dec1[1],-9223372036854775807)
    }

    @TestCase
    func test_intnative_carryingShl(): Unit {
        let shl = intnative_1.carryingShl(1)
        @Expect(shl[0],false)
        @Expect(shl[1],0)
        let shl1 = intnative_2.carryingShl(2)
        @Expect(shl1[0],false)
        @Expect(shl1[1],-4)
        let shl2 = intnative_2.carryingShl(0)
        @Expect(shl2[0],false)
        @Expect(shl2[1],9223372036854775807)
        let shl3 = intnative_2.carryingShl(20)
        @Expect(shl3[0],false)
        @Expect(shl3[1],-1048576)
    }

    @TestCase
    func test_intnative_carryingShr(): Unit {
        let shr = intnative_1.carryingShr(1)
        @Expect(shr[0],false)
        @Expect(shr[1],-4611686018427387904)
        let shr1 = intnative_2.carryingShr(2)
        @Expect(shr1[0],false)
        @Expect(shr1[1],2305843009213693951)
        let shr2 = intnative_2.carryingShr(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],9223372036854775807)
        let shr3 = intnative_2.carryingShr(20)
        @Expect(shr3[0],false)
        @Expect(shr3[1],8796093022207)
    }
}
