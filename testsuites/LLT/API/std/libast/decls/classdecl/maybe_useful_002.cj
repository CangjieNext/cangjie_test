// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
internal import std.ast.*

var res = 0

class MyVisitor <: Visitor {
    public override func visit(curExpr: ClassDecl) {
        println("ClassDecl!");
        res += 1
        return
    }

    public override func visit(_: Node): Unit {
        println("Node");
        res += 1
        return
    }
}

main() {
    let input = quote(
        class X{
        }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}

// ASSERT: scan-1 ClassDecl!
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
