// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let input = quote(
        @testMacro1[public](
        func test() {

        })
    )
    let decl = MacroExpandDecl(input)

    let output = quote($decl)
    let flag = compareTokens(input, output)

    if (!flag) {
        return 1
    }
    let ident = decl.identifier
    if (ident.value != "testMacro1") {
        return 2
    }

    let fullName = decl.fullIdentifier
    if (fullName.value != "testMacro1") {
        return 3
    }

    if (decl.lSquare.kind == ILLEGAL) {
        return 4
    }
    if (decl.rSquare.kind == ILLEGAL) {
        return 5
    }
    if (decl.lParen.kind == ILLEGAL) {
        return 6
    }
    if (decl.rParen.kind == ILLEGAL) {
        return 7
    }

    if (!compareTokens(decl.macroAttrs, quote(public))) {
        return 8
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
