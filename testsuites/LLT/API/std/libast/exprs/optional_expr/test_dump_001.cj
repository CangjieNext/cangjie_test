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

let opTokens = quote(a?(b))
let opExpr2 = parseExpr(opTokens)
let myVisitor = MyVisitor()

main(): Int64 {
    var flag = opExpr2 is CallExpr
    if (!flag) {
        return 1
    }
    let expr = (opExpr2 as CallExpr).getOrThrow()
    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        return 2
    }
    expr.dump()

    return 0
}

/* SCAN-IN
CallExpr {
  -callFunc: OptionalExpr {
    -baseExpr: RefExpr {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 17: 22
      }
    }
    -quest: Token {
      value: "?"
      kind: QUEST
      pos: 17: 23
    }
  }
  -arguments: 0, Argument {
    -expr: RefExpr {
      -identifier: Token {
        value: "b"
        kind: IDENTIFIER
        pos: 17: 25
      }
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
