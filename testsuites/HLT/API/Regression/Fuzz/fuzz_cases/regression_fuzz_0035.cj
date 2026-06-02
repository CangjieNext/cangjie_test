/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan expected ';' or '<NL>', found ','

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
    private static let entities = HashMap<String, Rune*Int64>(
            [("quot", ('"', 6)), ("amp", ('&', 5)), ("apos", ('\'', 6)),
             ("lt", ('<', 4)), ("gt", ('>', 4))])
}
    )
    let node = parseDecl(input)
    node.traverse(MyVisitor())
    0
}
