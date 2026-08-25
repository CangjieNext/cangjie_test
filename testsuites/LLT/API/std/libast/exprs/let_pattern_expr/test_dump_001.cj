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
        if(let Some(v) <- appHandler) {
            v.start()
        } else {
            logger.warn("AppCollection contains a WebHandler that not an AppHandler, this may be out of expected")
        }
    )
    let expr = match (parseExpr(input) as IfExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    var letPattern = (expr.condition as LetPatternExpr).getOrThrow()
    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 4) {
        return 2
    }
    expr.dump()
    return 0
}

/* SCAN-IN
IfExpr {
  -keywordI: Token {
    value: "if"
    kind: IF
    pos: 21: 9
  }
  -condition: LetPatternExpr {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 21: 12
    }
    -pattern: EnumPattern {
      -constructor: RefExpr {
        -identifier: Token {
          value: "Some"
          kind: IDENTIFIER
          pos: 21: 16
        }
      }
      -patterns: 0, VarOrEnumPattern {
        -identifier: Token {
          value: "v"
          kind: IDENTIFIER
          pos: 21: 21
        }
      }
    }
    -backArrow: Token {
      value: "<-"
      kind: BACKARROW
      pos: 21: 24
    }
    -expr: RefExpr {
      -identifier: Token {
        value: "appHandler"
        kind: IDENTIFIER
        pos: 21: 27
      }
    }
  }
  -ifBlock: Block {
    -nodes: 0, CallExpr {
      -callFunc: MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "v"
            kind: IDENTIFIER
            pos: 22: 13
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 22: 14
        }
        -field: Token {
          value: "start"
          kind: IDENTIFIER
          pos: 22: 15
        }
      }
    }
  }
  -keywordE: Token {
    value: "else"
    kind: ELSE
    pos: 23: 11
  }
  -elseExpr: Block {
    -nodes: 0, CallExpr {
      -callFunc: MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "logger"
            kind: IDENTIFIER
            pos: 24: 13
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 24: 19
        }
        -field: Token {
          value: "warn"
          kind: IDENTIFIER
          pos: 24: 20
        }
      }
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "AppCollection contains a WebHandler that not an AppHandler, this may be out of expected"
            kind: STRING_LITERAL
            pos: 24: 25
          }
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
