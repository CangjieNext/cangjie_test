/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: %n.c
// (!target_win) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (!target_win) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt -o %output
// (!target_win & !target_mac) RUN-EXEC-PIPE-139: %export MRT_STACK_CHECK=true && %run %run_opt %output %run_args 2>&1 | compare %f
// (!target_win & target_mac) RUN-EXEC-PIPE-138: %export MRT_STACK_CHECK=true && %run %run_opt %output %run_args 2>&1 | compare %f
// (!host_win & (target_win | target_mac | target_linux)) ASSERT: scan CJNative Handle signal: 10.
// (!host_win & (target_win | target_mac | target_linux)) ASSERT: scan unhandled SIGSEGV from unmanaged stack overflow!
// (!host_win & (target_win | target_mac | target_linux)) ASSERT: scan Thread "" catched unhandled SIGUSR1 (Bus error: 10) from native frame.
// (!host_win & target_ohos) ASSERT: scan Signal 11 (core dumped)
// (!host_win & target_android) ASSERT: scan Segmentation fault
// (!host_win & (target_ios | target_ios_simulator)) ASSERT: scan 


foreign func CfooTest(): Unit

main(): Unit {
    unsafe { CfooTest() }
}
