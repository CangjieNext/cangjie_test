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

foreign func run(
    cb1: CFunc<() -> Unit>,
    cb2: CFunc<() -> Unit>,
    cb3: CFunc<() -> Unit>,
    cb4: CFunc<() -> Unit>,
    cb5: CFunc<() -> Unit>,
    cb6: CFunc<() -> Unit>,
    cb7: CFunc<() -> Unit>,
    cb8: CFunc<() -> Unit>
): Unit

@C
func callableInC1(): Unit {}

@C
func callableInC2(): Unit {}

@C
func callableInC3(): Unit {}

@C
func callableInC4(): Unit {}

@C
func callableInC5(): Unit {}

@C
func callableInC6(): Unit {}

@C
func callableInC7(): Unit {}

@C
func callableInC8(): Unit {}

main() {
    var start = DateTime.now()
    for (i in 0..reps) {
        unsafe {
            run(
                callableInC1,
                callableInC2,
                callableInC3,
                callableInC4,
                callableInC5,
                callableInC6,
                callableInC7,
                callableInC8
            )
        }
    }
    var end = DateTime.now()
    var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
    println("BenchmarkCffiCallback3: " + perTime.format(".2") + " ns/op")
}
