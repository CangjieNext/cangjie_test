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
    let b: Array<Int8> = [2, 3]
    let c: Array<Int8> = [2, 3, 5, 7]
    let d: Array<Int8> = [2, 3, 5, 7, 9, 11]

    b.reverse()
    c.reverse()
    d.reverse()

    if (b[0] == 3 && b[1] == 2 && c[0] == 7 && c[1] == 5 && c[2] == 3 && c[3] == 2 && d[0] == 11 && d[1] == 9 && d[2] ==
        7 && d[3] == 5 && d[4] == 3 && d[5] == 2) {
        return 0
    }
    return 2
}
