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
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        Float64.toString()
    )
    let expr = match (parseExpr(input) as CallExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    let memAcc = (expr.callFunc as MemberAccess).getOrThrow()
    if (!(memAcc.baseExpr is PrimitiveTypeExpr)) {
        return 2
    }
    let primTypeExpr = (memAcc.baseExpr as PrimitiveTypeExpr).getOrThrow()
    if (primTypeExpr.keyword.value != "Float64") {
        return 3
    }
    expr.dump()
    return 0
}

/* SCAN-IN
CallExpr {
  -callFunc: MemberAccess {
    -baseExpr: PrimitiveTypeExpr {
      -keyword: Token {
        value: "Float64"
        kind: FLOAT64
        pos: 20: 9
      }
    }
    -dot: Token {
      value: "."
      kind: DOT
      pos: 20: 16
    }
    -field: Token {
      value: "toString"
      kind: IDENTIFIER
      pos: 20: 17
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
