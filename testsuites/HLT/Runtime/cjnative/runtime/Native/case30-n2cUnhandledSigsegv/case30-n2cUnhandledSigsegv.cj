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
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not MAC and not Windows) RUN-EXEC-PIPE-139: %run %run_opt %output %run_args 2>&1 | compare %f
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// (MAC and not iOS) RUN-EXEC-139: %run %run_opt %output %run_args
// (not Windows) ASSERT:scan SIGSEGV

foreign func CfooTest(): Unit

foreign func CfooSignal(): Unit

@C
public func C2CJ_Func(): Unit {
    unsafe { CfooSignal() }
}

func test_2(): Unit {
    unsafe { CfooTest() }
}

func test_1(): Unit {
    test_2()
}

main(): Unit {
    test_1()
}
