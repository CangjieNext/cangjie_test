// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c

// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan d = {1, 1, 1, 1}
// ASSERT: scan d = {2, 2, 2, 2}

foreign func PlusOneEachField(ptr: CPointer<Data>): Unit

@C
struct Data {
    var a: Int8 = 0
    var b: Int16 = 0
    var c: Int32 = 0
    var d: Int64 = 0
}

main() {
    var d = Data()
    unsafe { PlusOneEachField(inout d) }
    println("d = {${d.a}, ${d.b}, ${d.c}, ${d.d}}")
    unsafe { PlusOneEachField(inout d) }
    println("d = {${d.a}, ${d.b}, ${d.c}, ${d.d}}")
}
