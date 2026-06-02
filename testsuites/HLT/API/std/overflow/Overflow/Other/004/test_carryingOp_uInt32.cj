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

var uint32_1: UInt32 = UInt32.Min
var uint32_2: UInt32 = UInt32.Max
var uint32_3: UInt32 = 10000
var uintNat_1: UIntNative = UIntNative.Min
var uintNat_2: UIntNative = UIntNative.Max
var uintNat_3: UIntNative = 100000

@Test
class Test_carryingOp_UInt32 {
    @TestCase
    func test_int32_carryingAdd(): Unit {
        let add = uint32_1.carryingAdd(uint32_2)
        @Expect(add[0],false)
        @Expect(add[1],4294967295)
        let add1 = uint32_2.carryingAdd(1)
        @Expect(add1[0],true)
        @Expect(add1[1],0)
    }

    @TestCase
    func test_int32_carryingSub(): Unit {
        let sub = uint32_2.carryingSub(1)
        @Expect(sub[0],false)
        @Expect(sub[1],4294967294)
        let sub1 = uint32_1.carryingSub(5)
        @Expect(sub1[0],true)
        @Expect(sub1[1],4294967291)
    }

    @TestCase
    func test_int32_carryingMul(): Unit {
        let mul = uint32_2.carryingMul(0)
        @Expect(mul[0],false)
        @Expect(mul[1],0)
        let mul1 = uint32_1.carryingMul(2)
        @Expect(mul1[0],false)
        @Expect(mul1[1],0)
    }

    @TestCase
    func test_int32_carryingDiv(): Unit {
        let div = uint32_1.carryingDiv(2)
        @Expect(div[0],false)
        @Expect(div[1],0)
        let div1 = uint32_1.carryingDiv(2)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        let div2 = uint32_2.carryingDiv(2)
        @Expect(div2[0],false)
        @Expect(div2[1],2147483647)
    }

    @TestCase
    func test_int32_carryingMod(): Unit {
        let div = uint32_1.carryingMod(uint32_2)
        @Expect(div[0],false)
        @Expect(div[1],0)
        let div1 = uint32_1.carryingMod(1)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        try {
            uint32_2.carryingMod(0)
        } catch (e: ArithmeticException) {
            @Expect(e.toString(),"ArithmeticException: Divided by zero!")
        }
    }

    @TestCase
    func test_int32_carryingInc(): Unit {
        let Inc = uint32_1.carryingInc()
        @Expect(Inc[0],false)
        @Expect(Inc[1],1)
        let Inc1 = uint32_2.carryingInc()
        @Expect(Inc1[0],true)
        @Expect(Inc1[1],0)
    }

    @TestCase
    func test_int32_carryingDec(): Unit {
        let dec = uint32_1.carryingDec()
        @Expect(dec[0],true)
        @Expect(dec[1],4294967295)
        let dec1 = uint32_2.carryingDec()
        @Expect(dec1[0],false)
        @Expect(dec1[1],4294967294)
    }

    @TestCase
    func test_int32_carryingNeg(): Unit {
        let dec = uint32_1.carryingNeg()
        @Expect(dec[0],false)
        @Expect(dec[1],0)
        let dec1 = uint32_2.carryingNeg()
        @Expect(dec1[0],true)
        @Expect(dec1[1],1)
    }

    @TestCase
    func test_int32_carryingShl(): Unit {
        let shl = uint32_1.carryingShl(1)
        @Expect(shl[0],false)
        @Expect(shl[1],0)
        let shl1 = uint32_2.carryingShl(2)
        @Expect(shl1[0],false)
        @Expect(shl1[1],4294967292)
        let shl2 = uint32_2.carryingShl(0)
        @Expect(shl2[0],false)
        @Expect(shl2[1],4294967295)
        let shl3 = uint32_2.carryingShl(20)
        @Expect(shl3[0],false)
        @Expect(shl3[1],4293918720)
    }

    @TestCase
    func test_int32_carryingShr(): Unit {
        let shr = uint32_1.carryingShr(1)
        @Expect(shr[0],false)
        @Expect(shr[1],0)
        let shr1 = uint32_2.carryingShr(2)
        @Expect(shr1[0],false)
        @Expect(shr1[1],1073741823)
        let shr2 = uint32_2.carryingShr(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],4294967295)
        let shr3 = uint32_2.carryingShr(20)
        @Expect(shr3[0],false)
        @Expect(shr3[1],4095)
    }
}
