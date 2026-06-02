/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

var res = 0

class MyVisitor <: Visitor {}

main() {
    let assignExprToken = quote(_ = 1)
    let assignExpr = parseExpr(assignExprToken)
    let wee = match (assignExpr as AssignExpr) {
        case Some(v) => v.leftExpr
        case None => throw Exception("Not AssignExpr")
    }
    let visitor: Visitor = MyVisitor()
    let weeExpr = match (wee as WildcardExpr) {
        case Some(v) => v
        case None => throw Exception("Not WildcardExpr")
    }
    weeExpr.traverse(visitor)
    if (weeExpr.keyword.kind == WILDCARD) {
        return 0
    }
    return 1
}
