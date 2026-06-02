// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let input = quote(
        enum A {
            A1 | A2 | A3
        }
    )
    let enumDecl = EnumDecl(input)

    let decl = EnumDecl()
    decl.keyword = quote(enum)[0]
    decl.identifier = quote(testEnum)[0]
    decl.upperBound = Token(UPPERBOUND)
    let refType1 = RefType(quote(Inter1))
    let refType2 = RefType(quote(Inter2))
    decl.superTypes = ArrayList<TypeNode>([refType1, refType2])
    decl.superTypeBitAnds = quote(&)
    decl.lBrace = quote({)[0]
    decl.constructors = enumDecl.constructors
    decl.decls = enumDecl.decls
    decl.rBrace = quote(})[0]
    println(decl.toTokens())
    return 0
}

/* SCAN-IN
enum testEnum <: Inter1 & Inter2 {
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
