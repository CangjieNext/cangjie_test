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
    var input = quote(
        a as T
    )
    let asExpr = match (parseExpr(input) as AsExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    var flag = compareTokens(input, asExpr.toTokens())
    if (!flag) {
        return 1
    }
    asExpr.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 2
    }
    asExpr.dump()
    return 0
}

/* SCAN-IN
AsExpr {
  -expr: RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 21: 9
    }
  }
  -keyword: Token {
    value: "as"
    kind: AS
    pos: 21: 11
  }
  -shiftType: RefType {
    -identifier: Token {
      value: "T"
      kind: IDENTIFIER
      pos: 21: 14
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
