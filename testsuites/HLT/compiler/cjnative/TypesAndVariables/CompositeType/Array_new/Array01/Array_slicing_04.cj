/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 345
// ASSERT: scan-not 12

main(): Int64 {
    let arr: Array<Int64> = [1, 2, 3, 4, 5]
    for (i in arr[2..5]) {
        print(i.toString())
    }
    return 0
}
