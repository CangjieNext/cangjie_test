// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: ParenExpr) {
        breakTraverse()
    }
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        (a |> B)(a, b, c)
    )
    let expr = match (parseExpr(input) as CallExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    let callExpr = (expr.callFunc as ParenExpr).getOrThrow()
    if (!(callExpr.parenthesizedExpr is BinaryExpr)) {
        return 2
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 3) {
        return 3
    }
    expr.dump()
    return 0
}

/* SCAN-IN
CallExpr {
  -callFunc: ParenExpr {
    -expr: BinaryExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 23: 10
        }
      }
      -op: Token {
        value: "|>"
        kind: PIPELINE
        pos: 23: 12
      }
      -rightExpr: RefExpr {
        -identifier: Token {
          value: "B"
          kind: IDENTIFIER
          pos: 23: 15
        }
      }
    }
  }
  -arguments: 0, Argument {
    -expr: RefExpr {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 23: 18
      }
    }
  }
  -arguments: 1, Argument {
    -expr: RefExpr {
      -identifier: Token {
        value: "b"
        kind: IDENTIFIER
        pos: 23: 21
      }
    }
  }
  -arguments: 2, Argument {
    -expr: RefExpr {
      -identifier: Token {
        value: "c"
        kind: IDENTIFIER
        pos: 23: 24
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
