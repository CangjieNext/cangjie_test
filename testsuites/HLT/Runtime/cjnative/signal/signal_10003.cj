/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: sigfpe.c
// (not Windows) EXEC: %clang %clang_opt sigfpe.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt -o %output
// (not arm and not MAC and not Windows) RUN-EXEC-PIPE-136: %run %run_opt %output %run_args 2>&1 | compare %f
// (MAC) RUN-EXEC: %run %run_opt %output %run_args
// (not Windows) ASSERT:scan catched unhandled SIGFPE (Floating point exception) from native frame

foreign func foo(): Unit

main(): Unit {
    unsafe { foo() }
}
