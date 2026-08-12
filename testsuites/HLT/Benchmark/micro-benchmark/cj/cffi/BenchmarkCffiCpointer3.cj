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

foreign func getptr(num: Int8): CPointer<Int8>
foreign func testfunc(param1: CPointer<Int8>, param2: CPointer<Int8>, param3: CPointer<Int8>, param4: CPointer<Int8>): Int32

main(): Int64 {
    unsafe {
        var ptr1: CPointer<Int8> = getptr(1)
        var ptr2: CPointer<Int8> = getptr(2)
        var ptr3: CPointer<Int8> = getptr(3)
        var ptr4: CPointer<Int8> = getptr(4)
        var start = DateTime.now()
        for (i in 0..reps) {
            var res = testfunc(ptr1, ptr2, ptr3, ptr4)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiCpointer3: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
