// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let decl = MainDecl()
    decl.identifier = quote(main)[0]
    decl.lParen = Token(TokenKind.LPAREN)
    let param1 = FuncParam(quote(a: A))
    let param2 = FuncParam(quote(b: B))
    decl.funcParams = ArrayList<FuncParam>([param1, param2])
    decl.rParen = Token(TokenKind.RPAREN)
    decl.colon = Token(TokenKind.COLON)
    decl.declType = PrimitiveType(quote(Int64))
    decl.block = Block()
    println(decl.toTokens())
    return 0
}

/* SCAN-IN
main(a: A, b: B): Int64
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
