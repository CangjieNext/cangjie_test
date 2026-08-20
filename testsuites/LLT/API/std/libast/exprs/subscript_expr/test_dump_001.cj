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
        arr[..4][1..4:2]
    )
    let expr = match (parseExpr(input) as SubscriptExpr) {
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
SubscriptExpr {
  -baseExpr: SubscriptExpr {
    -baseExpr: RefExpr {
      -identifier: Token {
        value: "arr"
        kind: IDENTIFIER
        pos: 21: 9
      }
    }
    -indexList: 0, RangeExpr {
      -op: Token {
        value: ".."
        kind: RANGEOP
        pos: 21: 13
      }
      -end: LitConstExpr {
        -literal: Token {
          value: "4"
          kind: INTEGER_LITERAL
          pos: 21: 15
        }
      }
    }
  }
  -indexList: 0, RangeExpr {
    -start: LitConstExpr {
      -literal: Token {
        value: "1"
        kind: INTEGER_LITERAL
        pos: 21: 18
      }
    }
    -op: Token {
      value: ".."
      kind: RANGEOP
      pos: 21: 19
    }
    -end: LitConstExpr {
      -literal: Token {
        value: "4"
        kind: INTEGER_LITERAL
        pos: 21: 21
      }
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 21: 22
    }
    -step: LitConstExpr {
      -literal: Token {
        value: "2"
        kind: INTEGER_LITERAL
        pos: 21: 23
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
