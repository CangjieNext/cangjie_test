// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        if (curNode.identifier.value == "emptyArray") {
            curNode.identifier = Token(TokenKind.IDENTIFIER, "element")
        }
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        [1, 2, 3, emptyArray, 3, 2, 1]
    )
    let expr = match (parseExpr(input) as ArrayLiteral) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.traverse(myVisitor)
    if (expr.elements.size != 7) {
        return 2
    }
    expr.elements[4] = LitConstExpr(quote(10))
    expr.dump()
    return 0
}

/* SCAN-IN
ArrayLiteral {
  -elements: 0, LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 23: 10
    }
  }
  -elements: 1, LitConstExpr {
    -literal: Token {
      value: "2"
      kind: INTEGER_LITERAL
      pos: 23: 13
    }
  }
  -elements: 2, LitConstExpr {
    -literal: Token {
      value: "3"
      kind: INTEGER_LITERAL
      pos: 23: 16
    }
  }
  -elements: 3, RefExpr {
    -identifier: Token {
      value: "element"
      kind: IDENTIFIER
      pos: 13: 34
    }
  }
  -elements: 4, LitConstExpr {
    -literal: Token {
      value: "10"
      kind: INTEGER_LITERAL
      pos: 37: 43
    }
  }
  -elements: 5, LitConstExpr {
    -literal: Token {
      value: "2"
      kind: INTEGER_LITERAL
      pos: 23: 34
    }
  }
  -elements: 6, LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 23: 37
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
