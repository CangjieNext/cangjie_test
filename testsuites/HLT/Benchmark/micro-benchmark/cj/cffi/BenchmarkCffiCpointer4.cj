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

foreign func cfuncptr(): CFunc<() -> Unit>
foreign func testfunc(func1: CFunc<() -> Unit>, func2: CFunc<() -> Unit>, func3: CFunc<() -> Unit>, 
    func4: CFunc<() -> Unit>): Int32

main(): Int64 {
    unsafe {
        var cfunc1 = cfuncptr()
        var cfunc2 = cfuncptr()
        var cfunc3 = cfuncptr()
        var cfunc4 = cfuncptr()
        var start = DateTime.now()
        for (i in 0..reps) {
            var res = testfunc(cfunc1, cfunc2, cfunc3, cfunc4)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiCpointer4: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
