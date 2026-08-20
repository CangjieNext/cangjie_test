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
        f{ i * i }
    )
    let expr = match (parseExpr(input) as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 3) {
        return 2
    }

    expr.dump()
    return 0
}

/* SCAN-IN
TrailingClosureExpr {
  -expr: RefExpr {
    -identifier: Token {
      value: "f"
      kind: IDENTIFIER
      pos: 21: 9
    }
  }
  -lambdaExpr: LambdaExpr {
    -nodes: 0, BinaryExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "i"
          kind: IDENTIFIER
          pos: 21: 12
        }
      }
      -op: Token {
        value: "*"
        kind: MUL
        pos: 21: 14
      }
      -rightExpr: RefExpr {
        -identifier: Token {
          value: "i"
          kind: IDENTIFIER
          pos: 21: 16
        }
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
