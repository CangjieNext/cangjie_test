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
    param1: CString,
    param2: CString,
    param3: CString,
    param4: CString,
    param5: CString,
    param6: CString,
    param7: CString,
    param8: CString
): Int32

main(): Int64 {
    unsafe {
        var param1: CString = LibC.mallocCString("test1")
        var param2: CString = LibC.mallocCString("test2")
        var param3: CString = LibC.mallocCString("test3")
        var param4: CString = LibC.mallocCString("test4")
        var param5: CString = LibC.mallocCString("test5")
        var param6: CString = LibC.mallocCString("test6")
        var param7: CString = LibC.mallocCString("test7")
        var param8: CString = LibC.mallocCString("test8")
        var start = DateTime.now()
        for (i in 0..reps) {
            var res = testfunc(param1, param2, param3, param4, param5, param6, param7, param8)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiCString3: " + perTime.format(".2") + " ns/op")
    }
    return 0
}
