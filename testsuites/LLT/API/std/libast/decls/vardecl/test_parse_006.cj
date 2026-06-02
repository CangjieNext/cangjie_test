// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let decl = VarDecl()
    decl.keyword = quote(let)[0]
    decl.identifier = quote(testVar)[0]
    decl.colon = Token(COLON)
    decl.declType = PrimitiveType(quote(Int64))
    decl.pattern = VarPattern()
    println(decl.toTokens())
    return 0
}

/* SCAN-IN
let testVar : Int64
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
