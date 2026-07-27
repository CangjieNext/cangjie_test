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

foreign func Fibonacci1(fib: CPointer<Int32>): Int32

main() {
    var result: Array<Int32> = Array<Int32>(100, repeat: 0)
    var start = DateTime.now()
    for (i in 0..reps) {
        unsafe {
            let resultCph = acquireArrayRawData(result)
            let resultCp = resultCph.pointer
            Fibonacci1(CPointer<Int32>(resultCp))
            releaseArrayRawData(resultCph)
        }
    }
    var end = DateTime.now()
    var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
    println("BenchmarkCffiFibonacci1: " + perTime.format(".2") + " ns/op")
}
