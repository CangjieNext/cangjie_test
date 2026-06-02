// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

enum E {
    | A
    | A(Int64)
    | A(Bool, Bool)
    | B
    | C
}

main(): Int64 {
    let input = quote(
         match (x) {
             case A | A(0) | B => 0
             case C => 1
             case _ => 2
             
         }
    )

    let matchExpr = (parseExpr(input) as MatchExpr).getOrThrow()
    let output = quote($matchExpr)

    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }

    let matchCases = matchExpr.matchCases
    if (matchCases.size != 3) {
        return 2;
    }

    let patterns = matchCases[0].patterns
    if (patterns.size != 3) {
        return 3
    }
    if ((patterns[0] as VarOrEnumPattern).getOrThrow().identifier.value != "A") {
        return 4
    }
    if (((patterns[1] as EnumPattern).getOrThrow().constructor as RefExpr).getOrThrow().identifier.value != "A") {
        return 5
    }
    if ((patterns[2] as VarOrEnumPattern).getOrThrow().identifier.value != "B") {
        return 6
    }

    if (matchCases[1].patterns.size != 1 || !(matchCases[1].patterns[0] is VarOrEnumPattern)) {
        return 7
    }
    if ((matchCases[1].patterns[0] as VarOrEnumPattern).getOrThrow().identifier.value != "C") {
        return 8
    }

    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
