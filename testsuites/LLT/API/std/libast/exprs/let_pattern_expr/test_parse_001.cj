// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        while (let Some(v) <- a) {
            return v
        }
    )
    let whileExpr = (parseExpr(input) as WhileExpr).getOrThrow()
    let flag = whileExpr.condition is LetPatternExpr
    if (!flag) {
        return 1
    }
    let letPatternDestructor = (whileExpr.condition as LetPatternExpr).getOrThrow()
    let initExpr = (letPatternDestructor.expr as RefExpr).getOrThrow()
    let ident = initExpr.identifier
    if (ident.value != "a") {
        return 2
    }
    let pattern = (letPatternDestructor.pattern as EnumPattern).getOrThrow()
    if (pattern.patterns.size != 1) {
        return 3
    }
    if (!(pattern.patterns[0] is VarOrEnumPattern)) {
        return 4
    }
    let vpat = (pattern.patterns[0] as VarOrEnumPattern).getOrThrow()
    if (vpat.identifier.value != "v") {
        return 5
    }
    if (!(pattern.constructor is RefExpr)) {
        return 6
    }
    let patConstructor = (pattern.constructor as RefExpr).getOrThrow()
    if (patConstructor.identifier.value != "Some") {
        return 7
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
