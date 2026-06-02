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

var uint16_1: UInt16 = UInt16.Min
var uint16_2: UInt16 = UInt16.Max
var uint16_3: UInt16 = 1000
var uint32_1: UInt32 = UInt32.Min
var uint32_2: UInt32 = UInt32.Max
var uint32_3: UInt32 = 10000
var uintNat_1: UIntNative = UIntNative.Min
var uintNat_2: UIntNative = UIntNative.Max
var uintNat_3: UIntNative = 100000

@Test
class Test_carryingOp_UInt16 {
    @TestCase
    func test_uint16_carryingAdd(): Unit {
        let add = uint16_1.carryingAdd(uint16_2)
        @Expect(add[0],false)
        @Expect(add[1],65535)
        let add1 = uint16_2.carryingAdd(1)
        @Expect(add1[0],true)
        @Expect(add1[1],0)
    }

    @TestCase
    func test_uint16_carryingSub(): Unit {
        let sub = uint16_2.carryingSub(1)
        @Expect(sub[0],false)
        @Expect(sub[1],65534)
        let sub1 = uint16_1.carryingSub(1)
        @Expect(sub1[0],true)
        @Expect(sub1[1],65535)
    }

    @TestCase
    func test_uint16_carryingMul(): Unit {
        let mul = uint16_2.carryingMul(0)
        @Expect(mul[0],false)
        @Expect(mul[1],0)
        let mul1 = uint16_1.carryingMul(2)
        @Expect(mul1[0],false)
        @Expect(mul1[1],0)
    }

    @TestCase
    func test_uint16_carryingDiv(): Unit {
        let div = uint16_1.carryingDiv(2)
        @Expect(div[0],false)
        @Expect(div[1],0)
        let div1 = uint16_1.carryingDiv(2)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        let div2 = uint16_2.carryingDiv(2)
        @Expect(div2[0],false)
        @Expect(div2[1],32767)
    }

    @TestCase
    func test_uint16_carryingMod(): Unit {
        let div = uint16_1.carryingMod(uint16_2)
        @Expect(div[0],false)
        @Expect(div[1],0)
        let div1 = uint16_1.carryingMod(1)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        try {
            uint16_2.carryingMod(0)
        } catch (e: ArithmeticException) {
            @Expect(e.toString(),"ArithmeticException: Divided by zero!")
        }
    }

    @TestCase
    func test_uint16_carryingInc(): Unit {
        let Inc = uint16_1.carryingInc()
        @Expect(Inc[0],false)
        @Expect(Inc[1],1)
        let Inc1 = uint16_2.carryingInc()
        @Expect(Inc1[0],true)
        @Expect(Inc1[1],0)
    }

    @TestCase
    func test_uint16_carryingDec(): Unit {
        let dec = uint16_1.carryingDec()
        @Expect(dec[0],true)
        @Expect(dec[1],65535)
        let dec1 = uint16_2.carryingDec()
        @Expect(dec1[0],false)
        @Expect(dec1[1],65534)
    }

    @TestCase
    func test_uint16_carryingNeg(): Unit {
        let dec = uint16_1.carryingNeg()
        @Expect(dec[0],false)
        @Expect(dec[1],0)
        let dec1 = uint16_2.carryingNeg()
        @Expect(dec1[0],true)
        @Expect(dec1[1],1)
    }

    @TestCase
    func test_uint16_carryingShl(): Unit {
        let shl = uint16_1.carryingShl(1)
        @Expect(shl[0],false)
        @Expect(shl[1],0)
        let shl1 = uint16_2.carryingShl(2)
        @Expect(shl1[0],false)
        @Expect(shl1[1],65532)
        let shl2 = uint16_2.carryingShl(0)
        @Expect(shl2[0],false)
        @Expect(shl2[1],65535)
        let shl3 = uint16_2.carryingShl(20)
        @Expect(shl3[0],true)
        @Expect(shl3[1],65520)
    }

    @TestCase
    func test_uint16_carryingShr(): Unit {
        let shr = uint16_1.carryingShr(1)
        @Expect(shr[0],false)
        @Expect(shr[1],0)
        let shr1 = uint16_2.carryingShr(2)
        @Expect(shr1[0],false)
        @Expect(shr1[1],16383)
        let shr2 = uint16_2.carryingShr(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],65535)
        let shr3 = uint16_2.carryingShr(20)
        @Expect(shr3[0],true)
        @Expect(shr3[1],4095)
    }
}
