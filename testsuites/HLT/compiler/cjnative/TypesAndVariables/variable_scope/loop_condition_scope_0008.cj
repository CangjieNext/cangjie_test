/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var arr = [0, 1, 2, 3, 4]
    var sum = 0
    while (sum >= -1) {
        sum--
        for (i in arr where continue) {
            sum += i
        }
    }
    return sum + 2
}
