/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 1
}

let score: (Int64, Int64) = (1, 2)
var x: Int64 = 1
var y: Int64 = 1
var a: Int64 = 1
var b: Int64 = 1
var result: String = match (score) {
    case (x, y) | (a, b) => "fail"
    case _ => "not a valid score"
}
// ASSERT: scan sema_var_in_or_pattern
