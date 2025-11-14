/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: %n.c
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%dylib_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt -o %output
// (not MAC and not Windows) RUN-EXEC-PIPE-139: %export MRT_STACK_CHECK=true && %run %run_opt %output %run_args 2>&1 | compare %f
// (MAC and not Android and not iOS) RUN-EXEC-138: %export MRT_STACK_CHECK=true && %run %run_opt %output %run_args
// (not Windows) ASSERT:scan stack overflow

foreign func CfooTest(): Unit

main(): Unit {
    unsafe { CfooTest() }
}
