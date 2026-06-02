// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let decl = MacroExpandDecl()
    decl.keyword = quote(@)[0]
    decl.fullIdentifier = quote(testMacro)[0]
    decl.macroAttrs = quote(public)
    decl.lSquare = Token(LSQUARE)
    decl.rSquare = Token(RSQUARE)
    decl.lParen = Token(LPAREN)
    decl.rParen = Token(RPAREN)
    decl.macroInputs = Tokens()
    decl.macroInputDecl = FuncDecl(quote(func test() {}))
    println(decl.toTokens())
    return 0
}

/* SCAN-IN
@testMacro[public]
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
