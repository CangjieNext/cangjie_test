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

var uintnative_1: UIntNative = UIntNative.Min
var uintnative_2: UIntNative = UIntNative.Max
var uintnative_3: UIntNative = 10000

@Test
class Test_carryingOp_UIntNative {
    @TestCase
    func test_uintnative_carryingAdd(): Unit {
        let add = uintnative_1.carryingAdd(uintnative_1)
        @Expect(add[0],false)
        @Expect(add[1],0)
        let add1 = uintnative_1.carryingAdd(1)
        @Expect(add1[0],false)
        @Expect(add1[1],1)
    }

    @TestCase
    func test_uintnative_carryingSub(): Unit {
        let sub = uintnative_1.carryingSub(1)
        @Expect(sub[0],true)
        @Expect(sub[1],18446744073709551615)
        let sub1 = uintnative_2.carryingSub(1)
        @Expect(sub1[0],false)
        @Expect(sub1[1],18446744073709551614)
    }

    @TestCase
    func test_uintnative_carryingMul(): Unit {
        let mul = uintnative_1.carryingMul(0)
        @Expect(mul[0],false)
        @Expect(mul[1],0)
        let mul1 = uintnative_1.carryingMul(2)
        @Expect(mul1[0],false)
        @Expect(mul1[1],0)
    }

    @TestCase
    func test_uintnative_carryingDiv(): Unit {
        let div = uintnative_1.carryingDiv(2)
        @Expect(div[0],false)
        @Expect(div[1],0)
        let div1 = uintnative_1.carryingDiv(10)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        let div2 = uintnative_1.carryingDiv(2)
        @Expect(div2[0],false)
        @Expect(div2[1],0)
    }

    @TestCase
    func test_uintnative_carryingMod(): Unit {
        let div1 = uintnative_1.carryingMod(1)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        try {
            uintnative_1.carryingMod(uintnative_1)
        } catch (e: ArithmeticException) {
            @Expect(e.toString(),"ArithmeticException: Divided by zero!")
        }
    }

    @TestCase
    func test_uintnative_carryingInc(): Unit {
        let Inc = uintnative_1.carryingInc()
        @Expect(Inc[0],false)
        @Expect(Inc[1],1)
        let Inc1 = uintnative_1.carryingInc()
        @Expect(Inc1[0],false)
        @Expect(Inc1[1],1)
    }

    @TestCase
    func test_uintnative_carryingDec(): Unit {
        let dec = uintnative_1.carryingDec()
        @Expect(dec[0],true)
        @Expect(dec[1],18446744073709551615)
        let dec1 = uintnative_2.carryingDec()
        @Expect(dec1[0],false)
        @Expect(dec1[1],18446744073709551614)
    }

    @TestCase
    func test_uintnative_carryingNeg(): Unit {
        let dec = uintnative_1.carryingNeg()
        @Expect(dec[0],false)
        @Expect(dec[1],0)
        let dec1 = uintnative_1.carryingNeg()
        @Expect(dec1[0],false)
        @Expect(dec1[1],0)
    }

    @TestCase
    func test_uintnative_carryingShl(): Unit {
        let shl = uintnative_1.carryingShl(1)
        @Expect(shl[0],false)
        @Expect(shl[1],0)
        let shl1 = uintnative_1.carryingShl(2)
        @Expect(shl1[0],false)
        @Expect(shl1[1],0)
        let shl2 = uintnative_1.carryingShl(0)
        @Expect(shl2[0],false)
        @Expect(shl2[1],0)
        let shl3 = uintnative_1.carryingShl(20)
        @Expect(shl3[0],false)
        @Expect(shl3[1],0)
    }

    @TestCase
    func test_uintnative_carryingShr(): Unit {
        let shr = uintnative_1.carryingShr(1)
        @Expect(shr[0],false)
        @Expect(shr[1],0)
        let shr1 = uintnative_1.carryingShr(2)
        @Expect(shr1[0],false)
        @Expect(shr1[1],0)
        let shr2 = uintnative_1.carryingShr(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],0)
        let shr3 = uintnative_1.carryingShr(20)
        @Expect(shr3[0],false)
        @Expect(shr3[1],0)
    }
}
