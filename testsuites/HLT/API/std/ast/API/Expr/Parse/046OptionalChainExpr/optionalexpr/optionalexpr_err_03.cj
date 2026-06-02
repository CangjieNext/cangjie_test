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
import std.ast.*

let opTokens = quote(a?(b))
let opExpr2 = parseExpr(opTokens)

main(): Int64 {
    var flag = (opExpr2 is CallExpr)
    if (!flag) {
        return 1
    }
    match (opExpr2 as CallExpr) {
        case Some(v) => v
        case None => throw Exception("Not CallExpr")
    }
    return 0
}
