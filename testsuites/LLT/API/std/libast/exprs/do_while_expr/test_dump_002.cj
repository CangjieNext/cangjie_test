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
        while(readLen > 0) {
            writeChunks(data.slice(0, readLen))
            readLen = body.read(data)
        }
    )
    let expr = match (parseExpr(input) as WhileExpr) {
        case Some(v) => v
        case None => throw Exception()
    }

    var newNode = DoWhileExpr()
    newNode.keywordD = Token(TokenKind.DO)
    newNode.block = expr.block
    newNode.keywordW = Token(TokenKind.WHILE)
    newNode.condition = expr.condition

    var doWhileExpr = parseExpr(newNode.toTokens())
    doWhileExpr.dump()
    return 0
}

/* SCAN-IN
DoWhileExpr {
  -keywordD: Token {
    value: "do"
    kind: DO
    pos: 32: 24
  }
  -block: Block {
    -nodes: 0, CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "writeChunks"
          kind: IDENTIFIER
          pos: 22: 13
        }
      }
      -arguments: 0, Argument {
        -expr: CallExpr {
          -callFunc: MemberAccess {
            -baseExpr: RefExpr {
              -identifier: Token {
                value: "data"
                kind: IDENTIFIER
                pos: 22: 25
              }
            }
            -dot: Token {
              value: "."
              kind: DOT
              pos: 22: 29
            }
            -field: Token {
              value: "slice"
              kind: IDENTIFIER
              pos: 22: 30
            }
          }
          -arguments: 0, Argument {
            -expr: LitConstExpr {
              -literal: Token {
                value: "0"
                kind: INTEGER_LITERAL
                pos: 22: 36
              }
            }
          }
          -arguments: 1, Argument {
            -expr: RefExpr {
              -identifier: Token {
                value: "readLen"
                kind: IDENTIFIER
                pos: 22: 39
              }
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
          pos: 23: 13
        }
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 23: 21
      }
      -rightExpr: CallExpr {
        -callFunc: MemberAccess {
          -baseExpr: RefExpr {
            -identifier: Token {
              value: "body"
              kind: IDENTIFIER
              pos: 23: 23
            }
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 23: 27
          }
          -field: Token {
            value: "read"
            kind: IDENTIFIER
            pos: 23: 28
          }
        }
        -arguments: 0, Argument {
          -expr: RefExpr {
            -identifier: Token {
              value: "data"
              kind: IDENTIFIER
              pos: 23: 33
            }
          }
        }
      }
    }
  }
  -keywordW: Token {
    value: "while"
    kind: WHILE
    pos: 34: 24
  }
  -condition: BinaryExpr {
    -leftExpr: RefExpr {
      -identifier: Token {
        value: "readLen"
        kind: IDENTIFIER
        pos: 21: 15
      }
    }
    -op: Token {
      value: ">"
      kind: GT
      pos: 21: 23
    }
    -rightExpr: LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
        pos: 21: 25
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
