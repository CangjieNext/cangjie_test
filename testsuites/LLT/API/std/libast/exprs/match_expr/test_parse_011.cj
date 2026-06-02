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
    let code2 = quote(
            match {
                case 1 < 2 => "fail"
                case 2 < 1 => "wrong"
                case _ => "others"
            }
        )

    let matchExpr2 = (parseExpr(code2) as MatchExpr).getOrThrow()
    var matchcaseothers = matchExpr2.matchCases
    if (matchcaseothers.size != 3) {
        return 1
    }
    if (!(matchcaseothers[2].expr is WildcardExpr)) {
        return 2
    }

    let output2 = quote($matchExpr2)
    if (!compareTokens(code2, output2)) {
        return 3
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
