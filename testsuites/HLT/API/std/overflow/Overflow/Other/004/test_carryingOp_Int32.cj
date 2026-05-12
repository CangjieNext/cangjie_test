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

var int32_1: Int32 = Int32.Min
var int32_2: Int32 = Int32.Max
var int32_3: Int32 = 0
var intNat_1: IntNative = IntNative.Min
var intNat_2: IntNative = IntNative.Max
var intNat_3: IntNative = 0
var uint8_1: UInt8 = UInt8.Min
var uint8_2: UInt8 = UInt8.Max
var uint8_3: UInt8 = 100
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
class Test_carryingOp_Int32 {
    @TestCase
    func test_int32_carryingAdd(): Unit {
        let add = int32_1.carryingAdd(int32_2)
        @Expect(add[0],false)
        @Expect(add[1],-1)
        let add1 = int32_2.carryingAdd(1)
        @Expect(add1[0],true)
        @Expect(add1[1],-2147483648)
    }

    @TestCase
    func test_int32_carryingSub(): Unit {
        let sub = int32_2.carryingSub(1)
        @Expect(sub[0],false)
        @Expect(sub[1],2147483646)
        let sub1 = int32_1.carryingSub(5)
        @Expect(sub1[0],true)
        @Expect(sub1[1],2147483643)
    }

    @TestCase
    func test_int32_carryingMul(): Unit {
        let mul = int32_2.carryingMul(0)
        @Expect(mul[0],false)
        @Expect(mul[1],0)
        let mul1 = int32_1.carryingMul(2)
        @Expect(mul1[0],true)
        @Expect(mul1[1],0)
    }

    @TestCase
    func test_int32_carryingDiv(): Unit {
        let div = int32_1.carryingDiv(2)
        @Expect(div[0],false)
        @Expect(div[1],-1073741824)
        let div1 = int32_1.carryingDiv(-2)
        @Expect(div1[0],false)
        @Expect(div1[1],1073741824)
        let div2 = int32_2.carryingDiv(2)
        @Expect(div2[0],false)
        @Expect(div2[1],1073741823)
    }

    @TestCase
    func test_int32_carryingMod(): Unit {
        let div = int32_1.carryingMod(int32_2)
        @Expect(div[0],false)
        @Expect(div[1],-1)
        let div1 = int32_1.carryingMod(1)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        try {
            int32_2.carryingMod(0)
        } catch (e: ArithmeticException) {
            @Expect(e.toString(),"ArithmeticException: Divided by zero!")
        }
    }

    @TestCase
    func test_int32_carryingInc(): Unit {
        let Inc = int32_1.carryingInc()
        @Expect(Inc[0],false)
        @Expect(Inc[1],-2147483647)
        let Inc1 = int32_2.carryingInc()
        @Expect(Inc1[0],true)
        @Expect(Inc1[1],-2147483648)
    }

    @TestCase
    func test_int32_carryingDec(): Unit {
        let dec = int32_1.carryingDec()
        @Expect(dec[0],true)
        @Expect(dec[1],2147483647)
        let dec1 = int32_2.carryingDec()
        @Expect(dec1[0],false)
        @Expect(dec1[1],2147483646)
    }

    @TestCase
    func test_int32_carryingNeg(): Unit {
        let dec = int32_1.carryingNeg()
        @Expect(dec[0],true)
        @Expect(dec[1],-2147483648)
        let dec1 = int32_2.carryingNeg()
        @Expect(dec1[0],false)
        @Expect(dec1[1],-2147483647)
    }

    @TestCase
    func test_int32_carryingShl(): Unit {
        let shl = int32_1.carryingShl(1)
        @Expect(shl[0],false)
        @Expect(shl[1],0)
        let shl1 = int32_2.carryingShl(2)
        @Expect(shl1[0],false)
        @Expect(shl1[1],-4)
        let shl2 = int32_2.carryingShl(0)
        @Expect(shl2[0],false)
        @Expect(shl2[1],2147483647)
        let shl3 = int32_2.carryingShl(20)
        @Expect(shl3[0],false)
        @Expect(shl3[1],-1048576)
    }

    @TestCase
    func test_int32_carryingShr(): Unit {
        let shr = int32_1.carryingShr(1)
        @Expect(shr[0],false)
        @Expect(shr[1],-1073741824)
        let shr1 = int32_2.carryingShr(2)
        @Expect(shr1[0],false)
        @Expect(shr1[1],536870911)
        let shr2 = int32_2.carryingShr(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],2147483647)
        let shr3 = int32_2.carryingShr(20)
        @Expect(shr3[0],false)
        @Expect(shr3[1],2047)
    }
}
