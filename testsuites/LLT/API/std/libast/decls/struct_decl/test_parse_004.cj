// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let decl = StructDecl()
    decl.keyword = quote(struct)[0]
    decl.identifier = quote(testStruct)[0]
    decl.upperBound = Token(UPPERBOUND)
    let refType1 = RefType(quote(Inter1))
    let refType2 = RefType(quote(Inter2))
    decl.superTypes = ArrayList<TypeNode>([refType1, refType2])
    decl.superTypeBitAnds = quote(&)
    decl.body = Body()
    println(decl.toTokens())
    return 0
}

/* SCAN-IN
struct testStruct <: Inter1 & Inter2 {
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
