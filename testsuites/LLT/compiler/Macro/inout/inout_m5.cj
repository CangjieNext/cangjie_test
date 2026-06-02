// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj foo.c
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %clang %clang_opt foo.c -o libfoo.%dylib_suffix
// EXEC-PIPE: %run_macro %compiler %cmp_opt %f -L . -l foo -o %output
import define.*

foreign func PlusOne(ptr: CPointer<Int32>): Unit

@M2
func foo() {
    var a: Int32 = 0
    unsafe { PlusOne(inout a) }
    unsafe { PlusOne(inout a) }
}

@M2
main() {
    var a: Int32 = 0
    unsafe { PlusOne(inout a) }
    unsafe { PlusOne(inout a) }

    foo()
}
