// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var constPat: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: ConstPattern) {
        constPat.add("")
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let code = quote(
            match(score) {
                case 0 => "zero"
                case 10 | 20 | 30 | 40 | 50 => "fail"
                case _ => "pass"
            }
        )

    let matchExpr = (parseExpr(code) as MatchExpr).getOrThrow()

    let selector = matchExpr.selector
    let matchcases = matchExpr.matchCases

    if (!(selector is RefExpr)) {
        return 1
    }
    if (matchcases.size != 3) {
        return 2
    }
    if (matchcases[0].patterns.size != 1 || !(matchcases[0].patterns[0] is ConstPattern)) {
        return 3
    }

    matchExpr.traverse(myVisitor)
    if (myVisitor.constPat.size != 6) {
        return 4
    }

    let output1 = quote($matchExpr)
    if (!compareTokens(code, output1)) {
        return 5
    }
    if (matchcases[0].patterns[0] is EnumPattern) {
        return 6
    }
    if (matchcases[0].patterns[0] is VarOrEnumPattern) {
        return 7
    }
    if (!(matchcases[2].patterns[0] is WildcardPattern)) {
        return 8
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
