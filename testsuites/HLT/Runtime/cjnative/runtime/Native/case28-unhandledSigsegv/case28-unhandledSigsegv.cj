/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: %n.c
// (!host_win) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (!host_win) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (!host_win) RUN-EXEC-PIPE-139: %run %run_opt %output %run_args 2>&1 | compare %f
// (!host_win & target_android) ASSERT: scan Segmentation fault
// (!host_win & !target_android) ASSERT: scan SIGSEGV

foreign func CfooTest(): Unit

main(): Unit {
    unsafe { CfooTest() }
}
