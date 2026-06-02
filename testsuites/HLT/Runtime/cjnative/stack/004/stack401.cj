/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC and not O2)  RUN-EXEC-PIPE-1: %export cjStackSize=1gb && %run %run_opt %output %run_args 2>&1 | compare %f
// (not MAC) ASSERT: scan StackOverflowError

foreign func CJ_CJThreadStackSizeGet(): UInt64

func my_test_func(x: Int64): Unit {
    if (x < 0) {
        return
    } else {
        my_test_func(x + 1)
    }
}

main(): Int64 {
    let ret1 = unsafe { CJ_CJThreadStackSizeGet() }
    println(ret1)
    my_test_func(0)
    let ret2 = unsafe { CJ_CJThreadStackSizeGet() }
    println(ret2)
    return 0
}
