// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

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

    let block = (expr.elseExpr as Block).getOrThrow().nodes
    if (block.size != 1) {
        return 1
    }
    block[0].toTokens().dump()
    var returnExpr = parseExpr(block[0].toTokens())
    if (!(returnExpr is ReturnExpr)) {
        return 2
    }
    return 0
}

/* SCAN-IN
description: return, token_id: 108, token_literal_value: return, fileID: 1, line: 11, column: 9
description: bool_literal, token_id: 151, token_literal_value: false, fileID: 1, line: 11, column: 16
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
