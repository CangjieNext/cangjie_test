/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows and not iOS) RUN-EXEC-PIPE: %export cjStackSize=64kb && %run %run_opt %output %run_args 2>&1
// (Windows)RUN-EXEC-PIPE: %export cjStackSize=128kb && %run %run_opt %output %run_args 2>&1

foreign func CJ_CJThreadStackSizeGet(): UInt64

func my_test_func(x: Int64): Unit {
    if (x > 50000) {
        return
    } else {
        my_test_func(x + 1)
    }
}

main(): Int64 {
    let ret1 = unsafe { CJ_CJThreadStackSizeGet() }
    if (ret1 == 65536 || ret1 == 131072) {
        return 0
    }
    return 1
}
