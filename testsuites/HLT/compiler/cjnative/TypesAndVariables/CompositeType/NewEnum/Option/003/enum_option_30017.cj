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
    var d: (Int64) -> Int64 = {x: Int64 => x}
    var c: ?(Int64) -> Int64 = Some({x: Int64 => x + 1})
    var b: Int64 = 0
    var a: ?Int64 = 1
    var res = a ?? b |> c ?? d
    return res - 2
}
