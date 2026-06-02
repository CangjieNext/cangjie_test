/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

main(): Int64 {
    var a: Array<Int64> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let b = Int64(20)..50 : 1
    for (i in b) {
        print(i.toString())
    }
    var res: Int64 = 0
    for (i in a[b]) {
        res = res + i
    }
    return 0
}
