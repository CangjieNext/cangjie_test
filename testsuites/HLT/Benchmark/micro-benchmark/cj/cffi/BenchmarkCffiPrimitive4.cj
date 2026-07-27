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
    param1: Int64,
    param2: Int64,
    param3: Int64,
    param4: Int64,
    param5: Int64,
    param6: Int64,
    param7: Int64,
    param8: Int64,
    param9: Int64,
    param10: Int64,
    param11: Int64,
    param12: Int64,
    param13: Int64,
    param14: Int64,
    param15: Int64,
    param16: Int64
): Int32

main(): Int64 {
    unsafe {
        var param1: Int64 = 1
        var param2: Int64 = 2
        var param3: Int64 = 3
        var param4: Int64 = 4
        var param5: Int64 = 5
        var param6: Int64 = 6
        var param7: Int64 = 7
        var param8: Int64 = 8
        var param9: Int64 = 9
        var param10: Int64 = 10
        var param11: Int64 = 11
        var param12: Int64 = 12
        var param13: Int64 = 13
        var param14: Int64 = 14
        var param15: Int64 = 15
        var param16: Int64 = 16
        var start = DateTime.now()
        for (i in 0..reps) {
            var res: Int32 = testfunc(
                param1,
                param2,
                param3,
                param4,
                param5,
                param6,
                param7,
                param8,
                param9,
                param10,
                param11,
                param12,
                param13,
                param14,
                param15,
                param16
            )
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiPrimitive4: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
