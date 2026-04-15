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
// (!target_win) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (!target_win) RUN-EXEC-PIPE-139: %run %run_opt %output %run_args 2>&1 | compare %f
// (target_mac | target_linux) ASSERT: scan CJNative Handle signal: 11.
// (target_mac) ASSERT: scan Thread "" catched unhandled SIGSEGV (Segmentation fault: 11) from native frame.
// (target_linux) ASSERT: regex Thread ".*" catched unhandled SIGSEGV \(Segmentation fault\) from native frame.
// (target_ohos) ASSERT: scan Signal 11 (core dumped)
// (target_android) ASSERT: scan Segmentation fault
// (target_ios | target_ios_simulator) ASSERT: scan 

foreign func CfooTest(): Unit

main(): Unit {
    unsafe { CfooTest() }
}
