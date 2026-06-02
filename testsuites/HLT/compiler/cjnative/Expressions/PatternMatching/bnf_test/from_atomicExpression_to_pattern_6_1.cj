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

main(): Int64 {
    var c: Array<Int64> = [match (1) {
        case _ => 1
    }, match (1) {
        case _ => 2
    }]
    var b: Int64 = 0
    for (i in 0..2 : 1) {
        if (i == 1) {
            b = c[i]
        }
    }

    if (b != 2) {
        return 1
    }
    return 0
}
