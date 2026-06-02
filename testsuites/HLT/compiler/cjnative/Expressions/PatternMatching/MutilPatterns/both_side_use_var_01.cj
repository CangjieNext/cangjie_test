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

enum TimeUnit {
    | Day1(Int64)
}

let score: TimeUnit = Day1(1)
var x: Int64 = 1
var y: Int64 = 1
var result: String = match {
    case Day1(x) is TimeUnit | Day1(y) is TimeUnit => "fail"
    case _ => "not a valid score"
}
// ASSERT: scan sema_invalid_binary_expr
