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
        10..0:-2
    )
    let expr = match (parseExpr(input) as RangeExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.dump()
    return 0
}

/* SCAN-IN
RangeExpr {
  -start: LitConstExpr {
    -literal: Token {
      value: "10"
      kind: INTEGER_LITERAL
      pos: 21: 9
    }
  }
  -op: Token {
    value: ".."
    kind: RANGEOP
    pos: 21: 11
  }
  -end: LitConstExpr {
    -literal: Token {
      value: "0"
      kind: INTEGER_LITERAL
      pos: 21: 13
    }
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 21: 14
  }
  -step: LitConstExpr {
    -literal: Token {
      value: "-2"
      kind: INTEGER_LITERAL
      pos: 21: 15
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
