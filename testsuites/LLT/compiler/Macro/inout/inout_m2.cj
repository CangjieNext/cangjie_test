// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj foo.c
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %clang foo.c %clang_shared_opt -o libfoo.%dylib_suffix
// EXEC: %run_macro %compiler %cmp_opt %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 1
// ASSERT: scan 2

import define.*

foreign func PlusOne(ptr: CPointer<Int32>): Unit

main() {
    var a: Int32 = 0
    unsafe { PlusOne(@M0(inout a)) }
    println(a)
    unsafe { PlusOne(@M0(inout a)) }
    println(a)
}
