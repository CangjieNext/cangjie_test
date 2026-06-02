/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.ast.*

main() {
    let input = quote(
        if ( x == "e" ) {
        return true
            }else{
        return false
            }
    )
    let expr = (parseExpr(input) as IfExpr).getOrThrow()
    for (n in expr.ifBlock.nodes) {
        parseExpr(n.toTokens())
    }
    let block = (expr.elseExpr as Block).getOrThrow()
    block.nodes[0].toTokens().dump()
    var returnExpr = parseExpr(block.nodes[0].toTokens())
    if (!(returnExpr is ReturnExpr)) {
        return 1
    }
    return 0
}
