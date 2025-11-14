/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// DEPENDENCE: test.c
// EXEC: %clang %clang_opt -o libtest.%test_suffix test.c
// (not Android)EXEC: %export LIBRARY_PATH=./:$LIBRARY_PATH && %compiler %cmp_opt %f --library test --output %output
// (Android)EXEC: %export LIBRARY_PATH=./:$LIBRARY_PATH && %compiler %cmp_opt %f -L ./ --library test --output %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello World

foreign func printHello(): Unit

main() {
    unsafe {
        printHello()
    }
    return 0
}
