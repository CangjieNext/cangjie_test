// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-0: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

class A<T> where T <: CType {
    var a: T

    init(a: T) {
        this.a = a
    }
}

main() {
    var a1 = A<CPointer<Int64>>(CPointer<Int64>())
    println(a1.a.toUIntNative())

    var a2 = unsafe {A<CString>(LibC.mallocCString("Hello"))}
    println(a2.a.toString())
    unsafe { LibC.free(a2.a) }
}

// ASSERT: scan 0
// ASSERT: scan Hello
