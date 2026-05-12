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

var int64_1: Int64 = Int64.Min
var int64_2: Int64 = Int64.Max
var int64_3: Int64 = 0
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
    func test_int64_carryingAdd(): Unit {
        let add = int64_1.carryingAdd(int64_2)
        @Expect(add[0],false)
        @Expect(add[1],-1)
        let add1 = int64_2.carryingAdd(1)
        @Expect(add1[0],true)
        @Expect(add1[1],-9223372036854775808)
    }

    @TestCase
    func test_int64_carryingSub(): Unit {
        let sub = int64_2.carryingSub(1)
        @Expect(sub[0],false)
        @Expect(sub[1],9223372036854775806)
        let sub1 = int64_1.carryingSub(5)
        @Expect(sub1[0],true)
        @Expect(sub1[1],9223372036854775803)
    }

    @TestCase
    func test_int64_carryingMul(): Unit {
        let mul = int64_2.carryingMul(0)
        @Expect(mul[0],false)
        @Expect(mul[1],0)
        let mul1 = int64_1.carryingMul(2)
        @Expect(mul1[0],true)
        @Expect(mul1[1],0)
    }

    @TestCase
    func test_int64_carryingDiv(): Unit {
        let div = int64_1.carryingDiv(2)
        @Expect(div[0],false)
        @Expect(div[1],-4611686018427387904)
        let div1 = int64_1.carryingDiv(-2)
        @Expect(div1[0],false)
        @Expect(div1[1],4611686018427387904)
        let div2 = int64_2.carryingDiv(2)
        @Expect(div2[0],false)
        @Expect(div2[1],4611686018427387903)
    }

    @TestCase
    func test_int64_carryingMod(): Unit {
        let div = int64_1.carryingMod(int64_2)
        @Expect(div[0],false)
        @Expect(div[1],-1)
        let div1 = int64_1.carryingMod(1)
        @Expect(div1[0],false)
        @Expect(div1[1],0)
        try {
            int64_2.carryingMod(0)
        } catch (e: ArithmeticException) {
            @Expect(e.toString(),"ArithmeticException: Divided by zero!")
        }
    }

    @TestCase
    func test_int64_carryingInc(): Unit {
        let Inc = int64_1.carryingInc()
        @Expect(Inc[0],false)
        @Expect(Inc[1],-9223372036854775807)
        let Inc1 = int64_2.carryingInc()
        @Expect(Inc1[0],true)
        @Expect(Inc1[1],-9223372036854775808)
    }

    @TestCase
    func test_int64_carryingDec(): Unit {
        let dec = int64_1.carryingDec()
        @Expect(dec[0],true)
        @Expect(dec[1],9223372036854775807)
        let dec1 = int64_2.carryingDec()
        @Expect(dec1[0],false)
        @Expect(dec1[1],9223372036854775806)
    }

    @TestCase
    func test_int64_carryingNeg(): Unit {
        let dec = int64_1.carryingNeg()
        @Expect(dec[0],true)
        @Expect(dec[1],-9223372036854775808)
        let dec1 = int64_2.carryingNeg()
        @Expect(dec1[0],false)
        @Expect(dec1[1],-9223372036854775807)
    }

    @TestCase
    func test_int64_carryingShl(): Unit {
        let shl = int64_1.carryingShl(1)
        @Expect(shl[0],false)
        @Expect(shl[1],0)
        let shl1 = int64_2.carryingShl(2)
        @Expect(shl1[0],false)
        @Expect(shl1[1],-4)
        let shl2 = int64_2.carryingShl(0)
        @Expect(shl2[0],false)
        @Expect(shl2[1],9223372036854775807)
        let shl3 = int64_2.carryingShl(20)
        @Expect(shl3[0],false)
        @Expect(shl3[1],-1048576)
    }

    @TestCase
    func test_int64_carryingShr(): Unit {
        let shr = int64_1.carryingShr(1)
        @Expect(shr[0],false)
        @Expect(shr[1],-4611686018427387904)
        let shr1 = int64_2.carryingShr(2)
        @Expect(shr1[0],false)
        @Expect(shr1[1],2305843009213693951)
        let shr2 = int64_2.carryingShr(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],9223372036854775807)
        let shr3 = int64_2.carryingShr(20)
        @Expect(shr3[0],false)
        @Expect(shr3[1],8796093022207)
    }

    @TestCase
    func test_int64_carryingPow(): Unit {
        let shr = int64_1.carryingPow(1)
        @Expect(shr[0],false)
        @Expect(shr[1],-9223372036854775808)
        let shr1 = int64_1.carryingPow(2)
        @Expect(shr1[0],true)
        @Expect(shr1[1],0)
        let shr2 = int64_1.carryingPow(0)
        @Expect(shr2[0],false)
        @Expect(shr2[1],1)
        let shr3 = int64_1.carryingPow(20)
        @Expect(shr3[0],true)
        @Expect(shr3[1],0)
    }
}
