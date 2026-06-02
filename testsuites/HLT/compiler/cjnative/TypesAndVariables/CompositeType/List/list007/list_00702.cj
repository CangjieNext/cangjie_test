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
// ASSERT: scan 987654321

func test(): Int64 {
    var a: Array<Int64> = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    for (i in 0..a.size) {
        print(a[i].toString())
    }
    return 0
}

main(): Int64 {
    return test()
}
