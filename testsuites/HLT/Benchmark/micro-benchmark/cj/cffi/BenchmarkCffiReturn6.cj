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

foreign func testfunc(): Data32

@C
struct Data32 {
    var a0: Int8
    var a1: Int8
    var a2: Int16
    var a3: Int16
    var a4: Int32
    var a5: Int32
    var a6: Int64
    var a7: Int64
    public init(a0!: Int8, a1!: Int8, a2!: Int16, a3!: Int16, a4!: Int32, a5!: Int32, a6!: Int64, a7!: Int64) {
        this.a0 = a0
        this.a1 = a1
        this.a2 = a2
        this.a3 = a3
        this.a4 = a4
        this.a5 = a5
        this.a6 = a6
        this.a7 = a7
    }
}

main(): Int64 {
    unsafe {
        var start = DateTime.now()
        for (i in 0..reps) {
            var res: Data32 = testfunc()
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiReturn6: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
