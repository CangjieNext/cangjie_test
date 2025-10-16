// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.*
import std.collection.*

main() {
    let decl = MacroExpandDecl()
    println(decl.toTokens())//这个是修改以以前的结果
    decl.macroInputs = quote(struct B{})
    decl.keyword = Token(AT)
    decl.fullIdentifier = Token(IDENTIFIER, "M")
    decl.lParen = Token(LPAREN)
    decl.rParen = Token(RPAREN)
    println(decl.toTokens())//这个是修改以后的结果
    return 0
}

/* SCAN-IN
@M(struct B { })
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
