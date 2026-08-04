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

foreign func testfunc(
    param1: Data64,
    param2: Data64,
    param3: Data64,
    param4: Data64,
    param5: Data64,
    param6: Data64,
    param7: Data64,
    param8: Data64,
    param9: Data64,
    param10: Data64,
    param11: Data64,
    param12: Data64,
    param13: Data64,
    param14: Data64,
    param15: Data64,
    param16: Data64
): Int32

@C
struct Data64 {
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
    public init(a0!: Int8, a1!: Int8, a2!: Int16, a3!: Int16, a4!: Int32, a5!: Int32, a6!: Int64, a7!: Int64, 
        a8!: Int8, a9!: Int8, a10!: Int16, a11!: Int16, a12!: Int32, a13!: Int32, a14!: Int64, a15!: Int64) {
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
    }
}

main(): Int64 {
    unsafe {
        var param1: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param2: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param3: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param4: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param5: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param6: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param7: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param8: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param9: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param10: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param11: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param12: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param13: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param14: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param15: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var param16: Data64 = Data64(a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11,
            a11: 12, a12: 13, a13: 14, a14: 15, a15: 16)
        var start = DateTime.now()
        for (i in 0..reps) {
            var res: Int32 = testfunc(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10,
                param11, param12, param13, param14, param15, param16)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiStruct8: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
