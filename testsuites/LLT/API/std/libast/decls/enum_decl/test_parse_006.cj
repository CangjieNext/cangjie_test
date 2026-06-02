// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.collection.*

main() {
    let input0 = quote(
        enum A {
            A1 
            | A2 
            | ...
        }
    )

    let decl0 = parseDecl(input0)
    let enumDecl0 = match (decl0 as EnumDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag1 = compareTokens(input0, enumDecl0.toTokens())
    if (!flag1) {
        return 1
    }
    let input1 = quote(
        enum A {
            | A1 
            | A2 
            | ...
        }
    )

    let decl1 = parseDecl(input1)
    let enumDecl1 = match (decl1 as EnumDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag2 = compareTokens(input1, enumDecl1.toTokens())
    if (!flag2) {
        return 1
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
