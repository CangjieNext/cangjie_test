/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: sig.c sigcxx.cpp sigcxx.h
// (not Windows) EXEC: %clang++ -c %clang_opt sigcxx.cpp -o lib%n.cpp.cfile.%cffi_suffix
// (not Windows) EXEC: %clang -c %clang_opt sig.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile -l%n.cpp.cfile %f %cmp_opt -o %output
// (not Windows) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:scan signal success 2
// ASSERT:scan sigaction success 2

foreign func foo(): Unit

main(): Unit {
    unsafe { foo() }
}
