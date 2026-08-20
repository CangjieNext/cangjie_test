// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f


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
        do {
            read = clientSocket.read(buf)
            readLen += read
        } while (read != 0)
    )
    let expr = match (parseExpr(input) as DoWhileExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }

    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 6) {
        return 2
    }

    expr.dump()
    return 0
}

/* SCAN-IN
DoWhileExpr {
  -keywordD: Token {
    value: "do"
    kind: DO
    pos: 20: 9
  }
  -block: Block {
    -nodes: 0, AssignExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "read"
          kind: IDENTIFIER
          pos: 21: 13
        }
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 21: 18
      }
      -rightExpr: CallExpr {
        -callFunc: MemberAccess {
          -baseExpr: RefExpr {
            -identifier: Token {
              value: "clientSocket"
              kind: IDENTIFIER
              pos: 21: 20
            }
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 21: 32
          }
          -field: Token {
            value: "read"
            kind: IDENTIFIER
            pos: 21: 33
          }
        }
        -arguments: 0, Argument {
          -expr: RefExpr {
            -identifier: Token {
              value: "buf"
              kind: IDENTIFIER
              pos: 21: 38
            }
          }
        }
      }
    }
    -nodes: 1, AssignExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "readLen"
          kind: IDENTIFIER
          pos: 22: 13
        }
      }
      -assign: Token {
        value: "+="
        kind: ADD_ASSIGN
        pos: 22: 21
      }
      -rightExpr: RefExpr {
        -identifier: Token {
          value: "read"
          kind: IDENTIFIER
          pos: 22: 24
        }
      }
    }
  }
  -keywordW: Token {
    value: "while"
    kind: WHILE
    pos: 23: 11
  }
  -condition: BinaryExpr {
    -leftExpr: RefExpr {
      -identifier: Token {
        value: "read"
        kind: IDENTIFIER
        pos: 23: 18
      }
    }
    -op: Token {
      value: "!="
      kind: NOTEQ
      pos: 23: 23
    }
    -rightExpr: LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
        pos: 23: 26
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
