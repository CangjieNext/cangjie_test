// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan null
// ASSERT: scan null
// ASSERT: scan non-null

@C
func foo(ptr: CPointer<Int64>) {
    println(if (ptr.isNull()) {
        "null"
    } else {
        "non-null"
    })
}

unsafe main() {
    var ptr0 = CPointer<UInt8>()
    println(if (ptr0.isNull()) {
        "null"
    } else {
        "non-null"
    })
    var cs = CString(ptr0)
    var ptr1 = CPointer<Int64>(ptr0)
    foo(ptr1)
    var a = 0
    foo(inout a)
}
