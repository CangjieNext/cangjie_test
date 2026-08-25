// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: IfExpr) {
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        if (a > 2) {
            let b = a + foo()
            var c = b + 2
            c = c + 200 * 3
            return c
        } else if ( a < -2) {
            let c = 42
            return c
        } else {
            return 42
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
    var elseExpr = expr.elseExpr
    if (!(elseExpr is IfExpr)) {
        return 2
    }
    var ifExprNode = (elseExpr as IfExpr).getOrThrow()
    var block = ifExprNode.elseExpr
    if (!(block is Block)) {
        return 3
    }
    expr.dump()
    return 0
}

/* SCAN-IN
IfExpr {
  -keywordI: Token {
    value: "if"
    kind: IF
    pos: 23: 9
  }
  -condition: BinaryExpr {
    -leftExpr: RefExpr {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 23: 13
      }
    }
    -op: Token {
      value: ">"
      kind: GT
      pos: 23: 15
    }
    -rightExpr: LitConstExpr {
      -literal: Token {
        value: "2"
        kind: INTEGER_LITERAL
        pos: 23: 17
      }
    }
  }
  -ifBlock: Block {
    -nodes: 0, VarDecl {
      -keyword: Token {
        value: "let"
        kind: LET
        pos: 24: 13
      }
      -identifier: Token {
        value: "b"
        kind: IDENTIFIER
        pos: 24: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 24: 19
      }
      -expr: BinaryExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 24: 21
          }
        }
        -op: Token {
          value: "+"
          kind: ADD
          pos: 24: 23
        }
        -rightExpr: CallExpr {
          -callFunc: RefExpr {
            -identifier: Token {
              value: "foo"
              kind: IDENTIFIER
              pos: 24: 25
            }
          }
        }
      }
    }
    -nodes: 1, VarDecl {
      -keyword: Token {
        value: "var"
        kind: VAR
        pos: 25: 13
      }
      -identifier: Token {
        value: "c"
        kind: IDENTIFIER
        pos: 25: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 25: 19
      }
      -expr: BinaryExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "b"
            kind: IDENTIFIER
            pos: 25: 21
          }
        }
        -op: Token {
          value: "+"
          kind: ADD
          pos: 25: 23
        }
        -rightExpr: LitConstExpr {
          -literal: Token {
            value: "2"
            kind: INTEGER_LITERAL
            pos: 25: 25
          }
        }
      }
    }
    -nodes: 2, AssignExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "c"
          kind: IDENTIFIER
          pos: 26: 13
        }
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 26: 15
      }
      -rightExpr: BinaryExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "c"
            kind: IDENTIFIER
            pos: 26: 17
          }
        }
        -op: Token {
          value: "+"
          kind: ADD
          pos: 26: 19
        }
        -rightExpr: BinaryExpr {
          -leftExpr: LitConstExpr {
            -literal: Token {
              value: "200"
              kind: INTEGER_LITERAL
              pos: 26: 21
            }
          }
          -op: Token {
            value: "*"
            kind: MUL
            pos: 26: 25
          }
          -rightExpr: LitConstExpr {
            -literal: Token {
              value: "3"
              kind: INTEGER_LITERAL
              pos: 26: 27
            }
          }
        }
      }
    }
    -nodes: 3, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 27: 13
      }
      -expr: RefExpr {
        -identifier: Token {
          value: "c"
          kind: IDENTIFIER
          pos: 27: 20
        }
      }
    }
  }
  -keywordE: Token {
    value: "else"
    kind: ELSE
    pos: 28: 11
  }
  -elseExpr: IfExpr {
    -keywordI: Token {
      value: "if"
      kind: IF
      pos: 28: 16
    }
    -condition: BinaryExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 28: 21
        }
      }
      -op: Token {
        value: "<"
        kind: LT
        pos: 28: 23
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "-2"
          kind: INTEGER_LITERAL
          pos: 28: 25
        }
      }
    }
    -ifBlock: Block {
      -nodes: 0, VarDecl {
        -keyword: Token {
          value: "let"
          kind: LET
          pos: 29: 13
        }
        -identifier: Token {
          value: "c"
          kind: IDENTIFIER
          pos: 29: 17
        }
        -assign: Token {
          value: "="
          kind: ASSIGN
          pos: 29: 19
        }
        -expr: LitConstExpr {
          -literal: Token {
            value: "42"
            kind: INTEGER_LITERAL
            pos: 29: 21
          }
        }
      }
      -nodes: 1, ReturnExpr {
        -keyword: Token {
          value: "return"
          kind: RETURN
          pos: 30: 13
        }
        -expr: RefExpr {
          -identifier: Token {
            value: "c"
            kind: IDENTIFIER
            pos: 30: 20
          }
        }
      }
    }
    -keywordE: Token {
      value: "else"
      kind: ELSE
      pos: 31: 11
    }
    -elseExpr: Block {
      -nodes: 0, ReturnExpr {
        -keyword: Token {
          value: "return"
          kind: RETURN
          pos: 32: 13
        }
        -expr: LitConstExpr {
          -literal: Token {
            value: "42"
            kind: INTEGER_LITERAL
            pos: 32: 20
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
