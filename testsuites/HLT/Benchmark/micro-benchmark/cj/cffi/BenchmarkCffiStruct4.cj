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

foreign func testfunc(param1: Data256, param2: Data256, param3: Data256, param4: Data256): Int32

@C
struct Data256 {
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
    public init(a0!: Int8, a1!: Int8, a2!: Int16, a3!: Int16, a4!: Int32, a5!: Int32, a6!: Int64, a7!: Int64, 
        a8!: Int8, a9!: Int8, a10!: Int16, a11!: Int16, a12!: Int32, a13!: Int32, a14!: Int64, a15!: Int64, 
        a16!: Int64, a17!: Int64, a18!: Int64, a19!: Int64, a20!: Int64, a21!: Int64, a22!: Int64, a23!: Int64, 
        a24!: Int64, a25!: Int64, a26!: Int64, a27!: Int64, a28!: Int64, a29!: Int64, a30!: Int64, a31!: Int64, 
        a32!: Int64, a33!: Int64, a34!: Int64, a35!: Int64, a36!: Int64, a37!: Int64, a38!: Int64, a39!: Int64) {
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
    }
}

main(): Int64 {
    unsafe {
        var param1: Data256 = Data256(
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
            a39: 40
        )
        var param2: Data256 = Data256(
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
            a39: 40
        )
        var param3: Data256 = Data256(
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
            a39: 40
        )
        var param4: Data256 = Data256(
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
            a39: 40
        )
        var start = DateTime.now()
        for (i in 0..reps) {
            var res: Int32 = testfunc(param1, param2, param3, param4)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiStruct4: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
