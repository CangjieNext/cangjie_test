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

foreign func getptr(num: Int64): CPointer<Int64>
foreign func testfunc(
    param1: CPointer<Int64>,
    param2: CPointer<Int64>,
    param3: CPointer<Int64>,
    param4: CPointer<Int64>,
    param5: CPointer<Int64>,
    param6: CPointer<Int64>,
    param7: CPointer<Int64>,
    param8: CPointer<Int64>,
    param9: CPointer<Int64>,
    param10: CPointer<Int64>,
    param11: CPointer<Int64>,
    param12: CPointer<Int64>,
    param13: CPointer<Int64>,
    param14: CPointer<Int64>,
    param15: CPointer<Int64>,
    param16: CPointer<Int64>
): Int32

main(): Int64 {
    unsafe {
        var ptr1: CPointer<Int64> = getptr(1)
        var ptr2: CPointer<Int64> = getptr(2)
        var ptr3: CPointer<Int64> = getptr(3)
        var ptr4: CPointer<Int64> = getptr(4)
        var ptr5: CPointer<Int64> = getptr(5)
        var ptr6: CPointer<Int64> = getptr(6)
        var ptr7: CPointer<Int64> = getptr(7)
        var ptr8: CPointer<Int64> = getptr(8)
        var ptr9: CPointer<Int64> = getptr(9)
        var ptr10: CPointer<Int64> = getptr(10)
        var ptr11: CPointer<Int64> = getptr(11)
        var ptr12: CPointer<Int64> = getptr(12)
        var ptr13: CPointer<Int64> = getptr(13)
        var ptr14: CPointer<Int64> = getptr(14)
        var ptr15: CPointer<Int64> = getptr(15)
        var ptr16: CPointer<Int64> = getptr(16)
        var start = DateTime.now()
        for (i in 0..reps) {
            var res = testfunc(
                ptr1,
                ptr2,
                ptr3,
                ptr4,
                ptr5,
                ptr6,
                ptr7,
                ptr8,
                ptr9,
                ptr10,
                ptr11,
                ptr12,
                ptr13,
                ptr14,
                ptr15,
                ptr16
            )
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiCpointer7: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
