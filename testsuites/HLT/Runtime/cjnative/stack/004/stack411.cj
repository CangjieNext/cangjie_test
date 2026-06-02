/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC and not O2 and not OHOS) RUN-EXEC-PIPE: %export cjStackSize=2gb && %run %run_opt %output %run_args 2>&1

foreign func CJ_CJThreadStackSizeGet(): UInt64

func my_test_func(x: Int64): Unit {
    if (x > 50000) {
        return
    } else {
        my_test_func(x + 1)
    }
}

main() {
    let ret1 = unsafe { CJ_CJThreadStackSizeGet() }
    if (ret1 != 65536 && ret1 != 131072 && ret1 != 1048576) {
        return 1
    }
    my_test_func(0)
    let ret2 = unsafe { CJ_CJThreadStackSizeGet() }
    if (ret2 % ret1 != 0) {
        return 1
    }
    return 0
}
