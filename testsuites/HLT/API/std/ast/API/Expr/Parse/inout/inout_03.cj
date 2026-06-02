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

main() {
    var input = quote(f(inout a))
    let expr = parseExpr(input)
    if (expr is CallExpr) {
        var ce = match (expr as CallExpr) {
            case Some(v) => v
            case None => throw Exception("Not CallExpr")
        }
        var args = ce.arguments
        for (arg in args) {
            println("ok")
            if (!(arg is Argument)) {
                return 1
            }
        }
    }
    return 0
}
