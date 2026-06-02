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
    var x: () -> Int64 = {=> 0}
    let c1 = Option<() -> Int64>.Some(x)
    var res = match (c1) {
        case Some(v) => Some(v())
        case None => None<Int64>
    }
    return res ?? 1
}
