// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: foo.c pkg.cj
// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %compile_lib_opt %verbose_opt pkg.cj -L . -l foo -o pkg.%middle
// EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f -L . -l foo pkg.%middle -o %output
// EXEC-PIPE-1: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan hello world
// ASSERT: scan An exception has occurred:
// ASSERT: scan NoneValueException
package test

internal import pkg.*

main(): Int64 {
    println("hello world")
    unsafe { getTableField<String>(CPointer<Unit>(), 0, "") }
    return 0
}
