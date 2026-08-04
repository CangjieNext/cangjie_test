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

foreign func getptr(num: Int8, num2: Int16, num3: Int32, num4: Int64): CPointer<StructData>
foreign func testfunc(Data: CPointer<StructData>, Size: UInt32): Int32

@C
struct StructData {
    var a0: UInt32
    var a1: UInt32
    var a2: UInt32
    var a3: UInt8
    public init(a0!: UInt32, a1!: UInt32, a2!: UInt32, a3!: UInt8) {
        this.a0 = a0
        this.a1 = a1
        this.a2 = a2
        this.a3 = a3
    }
}

main() {
    unsafe {
        var ptr1: CPointer<StructData> = getptr(1, 2, 3, 4)
        var start = DateTime.now()
        for (i in 0..reps) {
            var res = testfunc(ptr1, 1)
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiExtra2: " + perTime.format(".2") + " ns/op")
    }
}
