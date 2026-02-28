/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test.c
// (not Windows) EXEC: %clang %clang_opt -o libtest.%test_suffix test.c
// (not Windows) EXEC: rm -rf abc;mkdir abc
// (not Windows) EXEC: mv libtest.%test_suffix abc
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %f --library test --library-path ./abc --output %output
// (CJNATIVE and not MAC and not Windows or OHOS) RUN-EXEC: %export LD_LIBRARY_PATH=./abc/:$LD_LIBRARY_PATH && %run %run_opt %output %run_args | compare %f
// (MAC and not OHOS and not Windows) RUN-EXEC: %export DYLD_LIBRARY_PATH=./abc/:$DYLD_LIBRARY_PATH && %run %run_opt %output %run_args | compare %f
// (not Windows) ASSERT: scan Hello World

foreign func printHello(): Unit

main() {
    unsafe {
        printHello()
    }
    return 0
}
