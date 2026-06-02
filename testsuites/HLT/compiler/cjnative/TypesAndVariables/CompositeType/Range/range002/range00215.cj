/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto An exception has occurred:
// ASSERT: regex-auto IllegalArgumentException:

main(): Int64 {
    var a: Array<Int64> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    if (a[9..-1 : Int64(-1)][0] != 9) {
        return 1
    }
    for (i in a[9..-1 : Int64(-1)]) {
        if (a[9..-1 : Int64(-1)][i] != 9 - i) {
            return 2
        }
    }
    return 0
}
