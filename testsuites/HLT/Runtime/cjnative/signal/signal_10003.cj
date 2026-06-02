/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: sigfpe.c
// (!host_win) EXEC: %clang %clang_opt sigfpe.c -o lib%n.c.cfile.%cffi_suffix
// (!host_win) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt -o %output
// (!host_win & !(target_mac | target_ios | target_ios_simulator)) RUN-EXEC-PIPE-136: %run %run_opt %output %run_args 2>&1 | compare %f
// (!host_win & !(target_mac | target_ios | target_ios_simulator)) ASSERT: scan catched unhandled SIGFPE (Floating point exception) from native frame
// when targeting MacOS & iOS, FPE would not be signaled.
// (!host_win & (target_mac | target_ios | target_ios_simulator)) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (!host_win & (target_mac | target_ios | target_ios_simulator)) ASSERT: scan res = 0

foreign func foo(): Unit

main(): Unit {
    unsafe { foo() }
}
