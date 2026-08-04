/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (LLVM) DEPENDENCE: %n.c
// (LLVM) EXEC: %clang %clang_opt %n.c -o %cffi_output
// (LLVM) EXEC: %compiler %cmp_opt %ffic_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg -o %output
// (LLVM) RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %run %run_opt %output %run_utest_opt %run_args


import std.time.*
import std.convert.*

var reps = 100000

foreign func testfunc(param1: Data512, param2: Data512, param3: Data512, param4: Data512): Int32

@C
struct Data512 {
    var a0: Int8
    var a1: Int8
    var a2: Int16
    var a3: Int16
    var a4: Int32
    var a5: Int32
    var a6: Int64
    var a7: Int64
    var a8: Int8
    var a9: Int8
    var a10: Int16
    var a11: Int16
    var a12: Int32
    var a13: Int32
    var a14: Int64
    var a15: Int64
    var a16: Int64
    var a17: Int64
    var a18: Int64
    var a19: Int64
    var a20: Int64
    var a21: Int64
    var a22: Int64
    var a23: Int64
    var a24: Int64
    var a25: Int64
    var a26: Int64
    var a27: Int64
    var a28: Int64
    var a29: Int64
    var a30: Int64
    var a31: Int64
    var a32: Int64
    var a33: Int64
    var a34: Int64
    var a35: Int64
    var a36: Int64
    var a37: Int64
    var a38: Int64
    var a39: Int64
    var a40: Int64
    var a41: Int64
    var a42: Int64
    var a43: Int64
    var a44: Int64
    var a45: Int64
    var a46: Int64
    var a47: Int64
    var a48: Int64
    var a49: Int64
    var a50: Int64
    var a51: Int64
    var a52: Int64
    var a53: Int64
    var a54: Int64
    var a55: Int64
    var a56: Int64
    var a57: Int64
    var a58: Int64
    var a59: Int64
    var a60: Int64
    var a61: Int64
    var a62: Int64
    var a63: Int64
    var a64: Int64
    var a65: Int64
    var a66: Int64
    var a67: Int64
    var a68: Int64
    var a69: Int64
    var a70: Int64
    var a71: Int64
    public init(a0!: Int8, a1!: Int8, a2!: Int16, a3!: Int16, a4!: Int32, a5!: Int32, a6!: Int64, a7!: Int64, 
        a8!: Int8, a9!: Int8, a10!: Int16, a11!: Int16, a12!: Int32, a13!: Int32, a14!: Int64, a15!: Int64, 
        a16!: Int64, a17!: Int64, a18!: Int64, a19!: Int64, a20!: Int64, a21!: Int64, a22!: Int64, a23!: Int64, 
        a24!: Int64, a25!: Int64, a26!: Int64, a27!: Int64, a28!: Int64, a29!: Int64, a30!: Int64, a31!: Int64, 
        a32!: Int64, a33!: Int64, a34!: Int64, a35!: Int64, a36!: Int64, a37!: Int64, a38!: Int64, a39!: Int64, 
        a40!: Int64, a41!: Int64, a42!: Int64, a43!: Int64, a44!: Int64, a45!: Int64, a46!: Int64, a47!: Int64, 
        a48!: Int64, a49!: Int64, a50!: Int64, a51!: Int64, a52!: Int64, a53!: Int64, a54!: Int64, a55!: Int64, 
        a56!: Int64, a57!: Int64, a58!: Int64, a59!: Int64, a60!: Int64, a61!: Int64, a62!: Int64, a63!: Int64, 
        a64!: Int64, a65!: Int64, a66!: Int64, a67!: Int64, a68!: Int64, a69!: Int64, a70!: Int64, a71!: Int64) {
        this.a0 = a0
        this.a1 = a1
        this.a2 = a2
        this.a3 = a3
        this.a4 = a4
        this.a5 = a5
        this.a6 = a6
        this.a7 = a7
        this.a8 = a8
        this.a9 = a9
        this.a10 = a10
        this.a11 = a11
        this.a12 = a12
        this.a13 = a13
        this.a14 = a14
        this.a15 = a15
        this.a16 = a16
        this.a17 = a17
        this.a18 = a18
        this.a19 = a19
        this.a20 = a20
        this.a21 = a21
        this.a22 = a22
        this.a23 = a23
        this.a24 = a24
        this.a25 = a25
        this.a26 = a26
        this.a27 = a27
        this.a28 = a28
        this.a29 = a29
        this.a30 = a30
        this.a31 = a31
        this.a32 = a32
        this.a33 = a33
        this.a34 = a34
        this.a35 = a35
        this.a36 = a36
        this.a37 = a37
        this.a38 = a38
        this.a39 = a39
        this.a40 = a40
        this.a41 = a41
        this.a42 = a42
        this.a43 = a43
        this.a44 = a44
        this.a45 = a45
        this.a46 = a46
        this.a47 = a47
        this.a48 = a48
        this.a49 = a49
        this.a50 = a50
        this.a51 = a51
        this.a52 = a52
        this.a53 = a53
        this.a54 = a54
        this.a55 = a55
        this.a56 = a56
        this.a57 = a57
        this.a58 = a58
        this.a59 = a59
        this.a60 = a60
        this.a61 = a61
        this.a62 = a62
        this.a63 = a63
        this.a64 = a64
        this.a65 = a65
        this.a66 = a66
        this.a67 = a67
        this.a68 = a68
        this.a69 = a69
        this.a70 = a70
        this.a71 = a71
    }
}

main(): Int64 {
    unsafe {
        var param1: Data512 = Data512(
            a0: 1,
            a1: 2,
            a2: 3,
            a3: 4,
            a4: 5,
            a5: 6,
            a6: 7,
            a7: 8,
            a8: 9,
            a9: 10,
            a10: 11,
            a11: 12,
            a12: 13,
            a13: 14,
            a14: 15,
            a15: 16,
            a16: 17,
            a17: 18,
            a18: 19,
            a19: 20,
            a20: 21,
            a21: 22,
            a22: 23,
            a23: 24,
            a24: 25,
            a25: 26,
            a26: 27,
            a27: 28,
            a28: 29,
            a29: 30,
            a30: 31,
            a31: 32,
            a32: 33,
            a33: 34,
            a34: 35,
            a35: 36,
            a36: 37,
            a37: 38,
            a38: 39,
            a39: 40,
            a40: 41,
            a41: 42,
            a42: 43,
            a43: 44,
            a44: 45,
            a45: 46,
            a46: 47,
            a47: 48,
            a48: 49,
            a49: 50,
            a50: 51,
            a51: 52,
            a52: 53,
            a53: 54,
            a54: 55,
            a55: 56,
            a56: 57,
            a57: 58,
            a58: 59,
            a59: 60,
            a60: 61,
            a61: 62,
            a62: 63,
            a63: 64,
            a64: 65,
            a65: 66,
            a66: 67,
            a67: 68,
            a68: 69,
            a69: 70,
            a70: 71,
            a71: 72
        )
        var param2: Data512 = Data512(
            a0: 1,
            a1: 2,
            a2: 3,
            a3: 4,
            a4: 5,
            a5: 6,
            a6: 7,
            a7: 8,
            a8: 9,
            a9: 10,
            a10: 11,
            a11: 12,
            a12: 13,
            a13: 14,
            a14: 15,
            a15: 16,
            a16: 17,
            a17: 18,
            a18: 19,
            a19: 20,
            a20: 21,
            a21: 22,
            a22: 23,
            a23: 24,
            a24: 25,
            a25: 26,
            a26: 27,
            a27: 28,
            a28: 29,
            a29: 30,
            a30: 31,
            a31: 32,
            a32: 33,
            a33: 34,
            a34: 35,
            a35: 36,
            a36: 37,
            a37: 38,
            a38: 39,
            a39: 40,
            a40: 41,
            a41: 42,
            a42: 43,
            a43: 44,
            a44: 45,
            a45: 46,
            a46: 47,
            a47: 48,
            a48: 49,
            a49: 50,
            a50: 51,
            a51: 52,
            a52: 53,
            a53: 54,
            a54: 55,
            a55: 56,
            a56: 57,
            a57: 58,
            a58: 59,
            a59: 60,
            a60: 61,
            a61: 62,
            a62: 63,
            a63: 64,
            a64: 65,
            a65: 66,
            a66: 67,
            a67: 68,
            a68: 69,
            a69: 70,
            a70: 71,
            a71: 72
        )
        var param3: Data512 = Data512(
            a0: 1,
            a1: 2,
            a2: 3,
            a3: 4,
            a4: 5,
            a5: 6,
            a6: 7,
            a7: 8,
            a8: 9,
            a9: 10,
            a10: 11,
            a11: 12,
            a12: 13,
            a13: 14,
            a14: 15,
            a15: 16,
            a16: 17,
            a17: 18,
            a18: 19,
            a19: 20,
            a20: 21,
            a21: 22,
            a22: 23,
            a23: 24,
            a24: 25,
            a25: 26,
            a26: 27,
            a27: 28,
            a28: 29,
            a29: 30,
            a30: 31,
            a31: 32,
            a32: 33,
            a33: 34,
            a34: 35,
            a35: 36,
            a36: 37,
            a37: 38,
            a38: 39,
            a39: 40,
            a40: 41,
            a41: 42,
            a42: 43,
            a43: 44,
            a44: 45,
            a45: 46,
            a46: 47,
            a47: 48,
            a48: 49,
            a49: 50,
            a50: 51,
            a51: 52,
            a52: 53,
            a53: 54,
            a54: 55,
            a55: 56,
            a56: 57,
            a57: 58,
            a58: 59,
            a59: 60,
            a60: 61,
            a61: 62,
            a62: 63,
            a63: 64,
            a64: 65,
            a65: 66,
            a66: 67,
            a67: 68,
            a68: 69,
            a69: 70,
            a70: 71,
            a71: 72
        )
        var param4: Data512 = Data512(
            a0: 1,
            a1: 2,
            a2: 3,
            a3: 4,
            a4: 5,
            a5: 6,
            a6: 7,
            a7: 8,
            a8: 9,
            a9: 10,
            a10: 11,
            a11: 12,
            a12: 13,
            a13: 14,
            a14: 15,
            a15: 16,
            a16: 17,
            a17: 18,
            a18: 19,
            a19: 20,
            a20: 21,
            a21: 22,
            a22: 23,
            a23: 24,
            a24: 25,
            a25: 26,
            a26: 27,
            a27: 28,
            a28: 29,
            a29: 30,
            a30: 31,
            a31: 32,
            a32: 33,
            a33: 34,
            a34: 35,
            a35: 36,
            a36: 37,
            a37: 38,
            a38: 39,
            a39: 40,
            a40: 41,
            a41: 42,
            a42: 43,
            a43: 44,
            a44: 45,
            a45: 46,
            a46: 47,
            a47: 48,
            a48: 49,
            a49: 50,
            a50: 51,
            a51: 52,
            a52: 53,
            a53: 54,
            a54: 55,
            a55: 56,
            a56: 57,
            a57: 58,
            a58: 59,
            a59: 60,
            a60: 61,
            a61: 62,
            a62: 63,
            a63: 64,
            a64: 65,
            a65: 66,
            a66: 67,
            a67: 68,
            a68: 69,
            a69: 70,
            a70: 71,
            a71: 72
        )
        var start = DateTime.now()
        for (i in 0..reps) {
            var res: Int32 = testfunc(param1, param2, param3, param4)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiStruct5: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
