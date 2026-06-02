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

package p

let x = 20

func add(p1: Int64, p2: Int64): Int64 {
    p1 + p2
}

main(): Int64 {
    let intNum: Int64 = 100
    let value = x
    add(12, 23)
    return 0
}
