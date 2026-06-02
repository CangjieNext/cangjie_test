// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c

// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -L . -l foo -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan *ptr = 0

foreign {
    func MemAlloc(ptr: CPointer<CPointer<Int64>>): Unit
    func free(ptr: CPointer<Int8>): Unit
}

main() {
    var ptr = CPointer<Int64>()
    if (!ptr.isNull()) {
        return 1
    }
    unsafe { MemAlloc(inout ptr) }
    if (ptr.isNull()) {
        return 1
    }
    let n = unsafe { ptr.read() }
    println("*ptr = ${n}")
    unsafe { free(CPointer<Int8>(ptr)) }
    0
}
