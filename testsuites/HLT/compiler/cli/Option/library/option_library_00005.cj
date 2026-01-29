/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.c
// (!host_win) EXEC: %clang %clang_opt -o libtest.%test_suffix test.c
// (!host_win) EXEC: rm -rf abc;mkdir abc
// (!host_win) EXEC: mv libtest.%test_suffix abc
// (!host_win) EXEC-PIPE: %compiler %cmp_opt %f --library test --library-path ./abc --output %output
// (!host_win & !target_mac) RUN-EXEC: %export LD_LIBRARY_PATH=./abc/:$LD_LIBRARY_PATH && %run %run_opt %output %run_args | compare %f
// (!host_win & target_mac) RUN-EXEC: %export DYLD_LIBRARY_PATH=./abc/:$DYLD_LIBRARY_PATH && %run %run_opt %output %run_args | compare %f
// (!host_win) ASSERT: scan Hello World

foreign func printHello(): Unit

main() {
    unsafe {
        printHello()
    }
    return 0
}
