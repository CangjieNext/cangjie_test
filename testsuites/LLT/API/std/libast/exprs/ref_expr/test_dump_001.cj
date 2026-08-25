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
        foo<Int32, T>(a,b)
    )
    let expr = match (parseExpr(input) as CallExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    let refExpr = (expr.callFunc as RefExpr).getOrThrow()
    if (refExpr.typeArguments.size != 2) {
        return 2
    }
    if (refExpr.identifier.value != "foo") {
        return 3
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 3) {
        return 4
    }
    expr.dump()
    return 0
}

/* SCAN-IN
CallExpr {
  -callFunc: RefExpr {
    -identifier: Token {
      value: "foo"
      kind: IDENTIFIER
      pos: 20: 9
    }
    typeArguments: 0, PrimitiveType {
      -keyword: Token {
        value: "Int32"
        kind: INT32
        pos: 20: 13
      }
    }
    typeArguments: 1, RefType {
      -identifier: Token {
        value: "T"
        kind: IDENTIFIER
        pos: 20: 20
      }
    }
  }
  -arguments: 0, Argument {
    -expr: RefExpr {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 20: 23
      }
    }
  }
  -arguments: 1, Argument {
    -expr: RefExpr {
      -identifier: Token {
        value: "b"
        kind: IDENTIFIER
        pos: 20: 25
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
