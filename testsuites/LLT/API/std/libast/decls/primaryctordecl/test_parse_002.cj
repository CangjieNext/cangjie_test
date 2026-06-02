// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let decl = PrimaryCtorDecl()
    let modifier = Modifier(quote(const)[0])
    decl.modifiers = ArrayList<Modifier>([modifier])
    decl.keyword = quote(init)[0]
    decl.identifier = quote(testInit)[0]
    decl.lParen = Token(TokenKind.LPAREN)
    let param1 = FuncParam(quote(a: A))
    let param2 = FuncParam(quote(b: B))
    decl.funcParams = ArrayList<FuncParam>([param1, param2])
    decl.rParen = Token(TokenKind.RPAREN)
    decl.block = Block()
    println(decl.toTokens())
    if (decl.isConst()) {
        return 0
    }
    return 1
}

/* SCAN-IN
const init testInit(a: A, b: B)
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
