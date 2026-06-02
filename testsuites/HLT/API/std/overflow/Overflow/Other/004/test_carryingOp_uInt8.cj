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

var uint8_1: UInt8 = UInt8.Min
var uint8_2: UInt8 = UInt8.Max
var uint8_3: UInt8 = 100

@Test
class Test_carryingOp_UInt8 {
    @TestCase
    func test_uint8_carryingAdd(): Unit {
        let add = uint8_1.carryingAdd(uint8_2)
        @Expect(add[0],false)
        @Expect(add[1],255)
        let add1 = uint8_2.carryingAdd(1)
        @Expect(add1[0],true)
        @Expect(add1[1],0)
    }

    @TestCase
    func test_uint8_carryingSub(): Unit {
        let sub = uint8_2.carryingSub(1)
        @Expect(sub[0],false)
        @Expect(sub[1],254)
        let sub1 = uint8_1.carryingSub(1)
        @Expect(sub1[0],true)
        @Expect(sub1[1],255)
    }

    @TestCase
    func test_uint8_carryingMul(): Unit {
        let mul = uint8_2.carryingMul(0)
        @Expect(mul[0],false)
        @Expect(mul[1],0)
        let mul1 = uint8_1.carryingMul(2)
        @Expect(mul1[0],false)
        @Expect(mul1[1],0)
    }

    @TestCase
    func test_uint8_carryingDiv(): Unit {
        let div = uint8_1.carryingDiv(2)
        @Expect(div[0],false)
        @Expect(div[1],0)
        let div1 = uint8_1.carryingDiv(5)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        let div2 = uint8_2.carryingDiv(2)
        @Expect(div2[0],false)
        @Expect(div2[1],127)
    }

    @TestCase
    func test_uint8_carryingMod(): Unit {
        let div = uint8_1.carryingMod(uint8_2)
        @Expect(div[0],false)
        @Expect(div[1],0)
        let div1 = uint8_1.carryingMod(1)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        try {
            uint8_1.carryingMod(0)
        } catch (e: ArithmeticException) {
            @Expect(e.toString(),"ArithmeticException: Divided by zero!")
        }
    }

    @TestCase
    func test_uint8_carryingInc(): Unit {
        let Inc = uint8_1.carryingInc()
        @Expect(Inc[0],false)
        @Expect(Inc[1],1)
        let Inc1 = uint8_2.carryingInc()
        @Expect(Inc1[0],true)
        @Expect(Inc1[1],0)
    }

    @TestCase
    func test_uint8_carryingDec(): Unit {
        let dec = uint8_1.carryingDec()
        @Expect(dec[0],true)
        @Expect(dec[1],255)
        let dec1 = uint8_2.carryingDec()
        @Expect(dec1[0],false)
        @Expect(dec1[1],254)
    }

    @TestCase
    func test_uint8_carryingNeg(): Unit {
        let dec = uint8_1.carryingNeg()
        @Expect(dec[0],false)
        @Expect(dec[1],0)
        let dec1 = uint8_2.carryingNeg()
        @Expect(dec1[0],true)
        @Expect(dec1[1],1)
    }

    @TestCase
    func test_uint8_carryingShl(): Unit {
        let shl = uint8_1.carryingShl(1)
        @Expect(shl[0],false)
        @Expect(shl[1],0)
        let shl1 = uint8_2.carryingShl(2)
        @Expect(shl1[0],false)
        @Expect(shl1[1],252)
        let shl2 = uint8_2.carryingShl(0)
        @Expect(shl2[0],false)
        @Expect(shl2[1],255)
        let shl3 = uint8_2.carryingShl(20)
        @Expect(shl3[0],true)
        @Expect(shl3[1],240)
    }

    @TestCase
    func test_uint8_carryingShr(): Unit {
        let shr = uint8_1.carryingShr(1)
        @Expect(shr[0],false)
        @Expect(shr[1],0)
        let shr1 = uint8_2.carryingShr(2)
        @Expect(shr1[0],false)
        @Expect(shr1[1],63)
        let shr2 = uint8_2.carryingShr(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],255)
        let shr3 = uint8_2.carryingShr(20)
        @Expect(shr3[0],true)
        @Expect(shr3[1],15)
    }
}
