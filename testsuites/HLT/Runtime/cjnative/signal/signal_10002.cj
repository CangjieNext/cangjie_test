/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: segfault.c
// (not Windows) EXEC: %clang -c %clang_opt segfault.c -o lib%n.c.cfile.%dylib_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt -o %output
// (not MAC and not Windows) RUN-EXEC-PIPE-139: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (MAC and not iOS) RUN-EXEC-139: %run %run_opt %output %run_args
// (not Windows) ASSERT:scan SIGSEGV

foreign func foo(): Unit

main(): Unit {
    unsafe { foo() }
}
