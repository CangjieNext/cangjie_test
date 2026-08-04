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

foreign func testfunc(param1: StructA): Int32

@C
struct StructA {
    var a0_0: Int8
    var a0_1: Int8
    var a0_2: Int8
    var a0_3: Int8
    var a0_4: Int8
    var a0_5: Int8
    var a1_0: Int8
    var a1_1: Int8
    var a1_2: Int8
    var a1_3: Int8
    var a1_4: Int8
    var a1_5: Int8
    var a2: UInt8
    var a3: UInt8
    var a4: UInt8
    var a5: UInt8
    var a6: UInt32
    var a7: StructB
    public init(a0_0!: Int8, a0_1!: Int8, a0_2!: Int8, a0_3!: Int8, a0_4!: Int8, a0_5!: Int8, a1_0!: Int8, 
        a1_1!: Int8, a1_2!: Int8, a1_3!: Int8, a1_4!: Int8, a1_5!: Int8, a2!: UInt8, a3!: UInt8, a4!: UInt8, 
        a5!: UInt8, a6!: UInt32, a7!: StructB) {
        this.a0_0 = a0_0
        this.a0_1 = a0_1
        this.a0_2 = a0_2
        this.a0_3 = a0_3
        this.a0_4 = a0_4
        this.a0_5 = a0_5
        this.a1_0 = a1_0
        this.a1_1 = a1_1
        this.a1_2 = a1_2
        this.a1_3 = a1_3
        this.a1_4 = a1_4
        this.a1_5 = a1_5
        this.a2 = a2
        this.a3 = a3
        this.a4 = a4
        this.a5 = a5
        this.a6 = a6
        this.a7 = a7
    }
}

@C
struct StructB {
    var b0_0: Int8
    var b0_1: Int8
    var b0_2: Int8
    var b0_3: Int8
    var b0_4: Int8
    var b0_5: Int8
    var b0_6: Int8
    var b0_7: Int8
    var b0_8: Int8
    var b0_9: Int8
    public init(b0_0!: Int8, b0_1!: Int8, b0_2!: Int8, b0_3!: Int8, b0_4!: Int8, b0_5!: Int8, b0_6!: Int8, 
        b0_7!: Int8, b0_8!: Int8, b0_9!: Int8, b0_10!: Int8, b0_11!: Int8, b0_12!: Int8, b0_13!: Int8, b0_14!: Int8, 
        b0_15!: Int8, b1!: UInt32, b2!: UInt32, b3_0!: Int8, b3_1!: Int8, b3_2!: Int8, b3_3!: Int8, b3_4!: Int8, 
        b3_5!: Int8, b4!: UInt8, b5!: UInt8, b6!: Int16, b7!: UInt16, b8!: UInt8, b9!: UInt8) {
        this.b0_0 = b0_0
        this.b0_1 = b0_1
        this.b0_2 = b0_2
        this.b0_3 = b0_3
        this.b0_4 = b0_4
        this.b0_5 = b0_5
        this.b0_6 = b0_6
        this.b0_7 = b0_7
        this.b0_8 = b0_8
        this.b0_9 = b0_9
        this.b0_10 = b0_10
        this.b0_11 = b0_11
        this.b0_12 = b0_12
        this.b0_13 = b0_13
        this.b0_14 = b0_14
        this.b0_15 = b0_15
        this.b1 = b1
        this.b2 = b2
        this.b3_0 = b3_0
        this.b3_1 = b3_1
        this.b3_2 = b3_2
        this.b3_3 = b3_3
        this.b3_4 = b3_4
        this.b3_5 = b3_5
        this.b4 = b4
        this.b5 = b5
        this.b6 = b6
        this.b7 = b7
        this.b8 = b8
        this.b9 = b9
    }
    var b0_10: Int8
    var b0_11: Int8
    var b0_12: Int8
    var b0_13: Int8
    var b0_14: Int8
    var b0_15: Int8
    var b1: UInt32
    var b2: UInt32
    var b3_0: Int8
    var b3_1: Int8
    var b3_2: Int8
    var b3_3: Int8
    var b3_4: Int8
    var b3_5: Int8
    var b4: UInt8
    var b5: UInt8
    var b6: Int16
    var b7: UInt16
    var b8: UInt8
    var b9: UInt8
}

main() {
    unsafe {
        var b: StructB = StructB(
            b0_0: 1,
            b0_1: 1,
            b0_2: 1,
            b0_3: 1,
            b0_4: 1,
            b0_5: 1,
            b0_6: 1,
            b0_7: 1,
            b0_8: 1,
            b0_9: 1,
            b0_10: 1,
            b0_11: 1,
            b0_12: 1,
            b0_13: 1,
            b0_14: 1,
            b0_15: 1,
            b1: 2,
            b2: 3,
            b3_0: 4,
            b3_1: 4,
            b3_2: 4,
            b3_3: 4,
            b3_4: 4,
            b3_5: 4,
            b4: 5,
            b5: 5,
            b6: 6,
            b7: 8,
            b8: 9,
            b9: 10
        )
        var a: StructA = StructA(
            a0_0: 1,
            a0_1: 1,
            a0_2: 1,
            a0_3: 1,
            a0_4: 1,
            a0_5: 1,
            a1_0: 2,
            a1_1: 2,
            a1_2: 2,
            a1_3: 2,
            a1_4: 2,
            a1_5: 2,
            a2: 3,
            a3: 4,
            a4: 5,
            a5: 6,
            a6: 7,
            a7: b
        )
        var start = DateTime.now()
        for (i in 0..reps) {
            var res = testfunc(a)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiExtra1: " + perTime.format(".2") + " ns/op")
    }
}
