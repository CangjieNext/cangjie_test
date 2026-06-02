// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public macro X(input:Tokens): Tokens {
            return input
        }
    )

    let decl = parseDecl(input)
    if (!(decl is MacroDecl)) {
        return 1
    }
    if (decl is MainDecl) {
        return 2
    }
    let output = quote($decl)
    if (!compareTokens(input, output)) {
        return 3
    }
    let macroDecl = MacroDecl(input)
    if (macroDecl.lParen.kind == ILLEGAL) {
        return 4
    }
    if (macroDecl.rParen.kind == ILLEGAL) {
        return 5
    }
    if (macroDecl.colon.kind == ILLEGAL) {
        return 6
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
