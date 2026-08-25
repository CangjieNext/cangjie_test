// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        -a
    )
    let ue = match (parseExpr(input) as UnaryExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, ue.toTokens())
    if (!flag) {
        return 1
    }
    ue.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 2
    }
    ue.dump()

    return 0
}

/* SCAN-IN
UnaryExpr {
  -op: Token {
    value: "-"
    kind: SUB
    pos: 21: 9
  }
  -expr: RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 21: 10
    }
  }
}
 */

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
