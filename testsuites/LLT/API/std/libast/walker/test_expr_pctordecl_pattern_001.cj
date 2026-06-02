// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

internal import std.ast.*

var res = 0

class MyVisitor <: Visitor {
    public override func visit(curNode: Expr) {
        println("Expr!");
        res += 1
    }

    public override func visit(curDecl: PrimaryCtorDecl) {
        println("PrimaryCtorDecl!");
        res += 1
    }

    public override func visit(curPattern: Pattern) {
        println("Pattern!");
        res += 1
    }
}

main() {
    let input = quote(
        match {
                case 1 < 2 => "fail"
                case 2 < 1 => "wrong"
                case _ => "others"
            }
    )
    let decl = (parseExpr(input) as MatchExpr).getOrThrow()
    println(decl.dump())
    let matchcaseothers = decl.matchCases
    let visitor = MyVisitor()
    for (i in matchcaseothers) {
        i.traverse(visitor)
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
