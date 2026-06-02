//EXEC:%compiler %cmp_opt_chir2hlir %f -o %output
//EXEC: %run %run_opt %output
internal import std.ast.*

main(): Int64 {
    let input = quote(
        public let (a, b, c) = (3, 4, 5)
    )
    let varWithPatternDecl = (parseDecl(input) as VarDecl).getOrThrow()

    let modifiers = varWithPatternDecl.modifiers
    if (modifiers.size != 1 || modifiers[0].keyword.value != "public") {
        return 1
    }
    if (!(varWithPatternDecl.pattern is TuplePattern)) {
        return 3
    }
    try {
        varWithPatternDecl.declType
    } catch (e: Exception) {
        println("catch")
    }
    if (varWithPatternDecl.keyword.value != "let" || !(varWithPatternDecl.expr is TupleLiteral)) {
        return 3
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
