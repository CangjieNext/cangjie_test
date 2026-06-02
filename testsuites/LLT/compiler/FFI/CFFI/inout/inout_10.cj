// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c

// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 0, 1
// ASSERT: scan 2, 3

foreign func PlusOne(ptr: CPointer<Int64>): Unit

struct Data {
    var a = 0
    var b = 1

    mut func modify() {
        unsafe {
            PlusOne(inout a)
            PlusOne(inout b)
            PlusOne(inout this.a)
            PlusOne(inout this.b)
        }
    }
}

class A {
    var a = 0
    var d = Data()
}

main() {
    var a = A()
    var d = a.d
    println("${d.a}, ${d.b}")
    d.modify()
    println("${d.a}, ${d.b}")
}
