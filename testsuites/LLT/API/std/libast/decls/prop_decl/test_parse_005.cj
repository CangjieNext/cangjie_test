// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let decl = PropDecl()
    decl.keyword = quote(prop)[0]
    decl.identifier = quote(testProp)[0]
    decl.colon = Token(COLON)
    decl.declType = PrimitiveType(quote(Int64))
    decl.lBrace = quote({)[0]
    decl.rBrace = quote(})[0]
    decl.getter = FuncDecl()
    decl.setter = FuncDecl()
    println(decl.toTokens())
    return 0
}

/* SCAN-IN
prop testProp: Int64 {
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
