/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.collection.*

class MyVisitor <: Visitor {
    public override func visit(decl: CallExpr) {
        println(decl.toTokens())
        return
    }
}

main() {
    let input = quote(
class Exml {
    private static let entities = HashMap<String, (Rune,Int64)>(
            [("quot", (r'"', 6)), ("amp", (r'&', 5)), ("apos", (r'\'', 6)),
             ("lt", (r'<', 4)), ("gt", (r'>', 4))])
}
    )
    let node = parseDecl(input)
    node.traverse(MyVisitor())
    0
}
