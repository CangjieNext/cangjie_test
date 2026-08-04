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

foreign func testfunc(param1: Int32, param2: Int32, param3: Int32, param4: Int32): Int32

main(): Int64 {
    unsafe {
        var param1: Int32 = 2894
        var param2: Int32 = 156
        var param3: Int32 = 1846
        var param4: Int32 = 333
        var start = DateTime.now()
        for (i in 0..reps) {
            var res: Int32 = testfunc(param1, param2, param3, param4)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiPrimitive7: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
