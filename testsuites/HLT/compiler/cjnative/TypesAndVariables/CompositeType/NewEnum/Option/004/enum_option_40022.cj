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
    let a = {i: Int64 => i}
    let x = {i: Int64 => a}
    let y = {i: Int64 => x}
    let c1: ?(Int64) -> ((Int64) -> ((Int64) -> Int64)) = y
    var r3: ?Int64 = c1?(0)(0)(0)
    return r3 ?? 1
}
