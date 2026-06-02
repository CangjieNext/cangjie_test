// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public macro M(input: Tokens, attrs: Tokens) : Tokens {
            parseDecl(input) as Funcdecl
            return input + attrs
        }
    )
    let md = parseDecl(input) as MacroDecl
    var macroDecl = match (md) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($macroDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    // Test identifier.
    if (macroDecl.keyword.value != "macro") {
        return 2
    }
    // Test return type.
    let ty = macroDecl.declType
    if (!(ty is RefType)) {
        return 3
    }

    // Test modifiers.
    let modifiers = macroDecl.modifiers
    if (modifiers.size != 1) {
        return 4
    }

    macroDecl.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
