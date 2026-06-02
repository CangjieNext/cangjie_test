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

func item(x: Int64, y: (Int64) -> Int64) {
    y(x)
}

main(): Int64 {
    let c1: ?(Int64, (Int64) -> Int64) -> Int64 = item
    let r1 = c1?(100) {a: Int64 => a}
    let res = r1 ?? 0
    return res - 100
}
