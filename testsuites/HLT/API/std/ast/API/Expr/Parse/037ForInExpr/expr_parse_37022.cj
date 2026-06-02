/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.ast.*

main() {
    var input: Tokens = quote(
        for (i in match(a){case _=> a} where match(a){case _=>b}){
            match(a){case _=>c}
        }
    )
    let expr = parseExpr(input)
    if (expr is ForInExpr) {
        var forExpr = match (expr as ForInExpr) {
            case Some(v) => v
            case None => throw Exception("Not ForInExpr")
        }
        var iExpr = match (forExpr.pattern as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        if (iExpr != "i") {
            return 2
        }
        if (!(forExpr.expr is MatchExpr)) {
            return 3
        }

        if (!(forExpr.patternGuard is MatchExpr)) {
            return 6
        }
        var bodyExpr = match (forExpr.block as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        if (!(bodyExpr is MatchExpr)) {
            return 7
        }
        return 0
    }
    return 1
}
