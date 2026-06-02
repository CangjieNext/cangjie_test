/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 

import std.ast.*

var res = 0

class MyVisitor <: Visitor {
    public override func visit(x: VarDecl): Unit {
        res += 1
        breakTraverse()
        return
    }
    public override func visit(x: TupleLiteral): Unit {
        res += 1
        println("visitTupleLiteral")
        return
    }
}

main() {
    let input = quote(
    var x = (1,2,3)
    )
    let vardecl = parseDecl(input)
    let visitor = MyVisitor()
    vardecl.traverse(visitor)

    return res - 1
}
