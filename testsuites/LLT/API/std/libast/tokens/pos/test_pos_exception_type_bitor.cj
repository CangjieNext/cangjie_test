// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(try {} catch (e: A | B   | C) {})

    let pat = (parseExpr(input) as TryExpr).getOrThrow().catchPatterns[0]
    var p = (pat as ExceptTypePattern).getOrThrow()
    let output = p.toTokens()
    output.dump()
    if (output.size != 7) {
        return 1
    }
    let bitOr1 = output[3]
    if (bitOr1.kind != TokenKind.BITOR || bitOr1.pos.column != 42) {
        return 2
    }
    let bitOr2 = output[5]
    if (bitOr2.kind != TokenKind.BITOR || bitOr2.pos.column != 48) {
        return 3
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
