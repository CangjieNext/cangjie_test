// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        if (curNode.identifier.value == "mutex") {
            curNode.identifier = Token(TokenKind.IDENTIFIER, "mutex1")
        }
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        synchronized (mutex) {
            if (endIndex == 0) {
                if (!readFromConsole()) {
                    return Option<Rune>.None
                }
            }
            let result: Option<Rune> = this.getRune()
            buffer = buffer.slice(1, buffer.size - 1)
            endIndex -= 1
            return result
        }
    )
    let expr = match (parseExpr(input) as SynchronizedExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.traverse(myVisitor)
    if ((expr.structuredMutex as RefExpr).getOrThrow().identifier.value != "mutex1") {
        return 2
    }
    expr.dump()
    return 0
}

/* SCAN-IN
SynchronizedExpr {
  -structuredMutex: RefExpr {
    -identifier: Token {
      value: "mutex1"
      kind: IDENTIFIER
      pos: 13: 34
    }
  }
  -block: Block {
    -nodes: 0, IfExpr {
      -keywordI: Token {
        value: "if"
        kind: IF
        pos: 24: 13
      }
      -condition: BinaryExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "endIndex"
            kind: IDENTIFIER
            pos: 24: 17
          }
        }
        -op: Token {
          value: "=="
          kind: EQUAL
          pos: 24: 26
        }
        -rightExpr: LitConstExpr {
          -literal: Token {
            value: "0"
            kind: INTEGER_LITERAL
            pos: 24: 29
          }
        }
      }
      -ifBlock: Block {
        -nodes: 0, IfExpr {
          -keywordI: Token {
            value: "if"
            kind: IF
            pos: 25: 17
          }
          -condition: UnaryExpr {
            -op: Token {
              value: "!"
              kind: NOT
              pos: 25: 21
            }
            -expr: CallExpr {
              -callFunc: RefExpr {
                -identifier: Token {
                  value: "readFromConsole"
                  kind: IDENTIFIER
                  pos: 25: 22
                }
              }
            }
          }
          -ifBlock: Block {
            -nodes: 0, ReturnExpr {
              -keyword: Token {
                value: "return"
                kind: RETURN
                pos: 26: 21
              }
              -expr: MemberAccess {
                -baseExpr: RefExpr {
                  -identifier: Token {
                    value: "Option"
                    kind: IDENTIFIER
                    pos: 26: 28
                  }
                  typeArguments: 0, PrimitiveType {
                    -keyword: Token {
                      value: "Rune"
                      kind: RUNE
                      pos: 26: 35
                    }
                  }
                }
                -dot: Token {
                  value: "."
                  kind: DOT
                  pos: 26: 40
                }
                -field: Token {
                  value: "None"
                  kind: IDENTIFIER
                  pos: 26: 41
                }
              }
            }
          }
        }
      }
    }
    -nodes: 1, VarDecl {
      -keyword: Token {
        value: "let"
        kind: LET
        pos: 29: 13
      }
      -identifier: Token {
        value: "result"
        kind: IDENTIFIER
        pos: 29: 17
      }
      -declType: RefType {
        -identifier: Token {
          value: "Option"
          kind: IDENTIFIER
          pos: 29: 25
        }
        -typeArguments: 0, PrimitiveType {
          -keyword: Token {
            value: "Rune"
            kind: RUNE
            pos: 29: 32
          }
        }
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 29: 38
      }
      -expr: CallExpr {
        -callFunc: MemberAccess {
          -baseExpr: RefExpr {
            -identifier: Token {
              value: "this"
              kind: THIS
              pos: 29: 40
            }
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 29: 44
          }
          -field: Token {
            value: "getRune"
            kind: IDENTIFIER
            pos: 29: 45
          }
        }
      }
    }
    -nodes: 2, AssignExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "buffer"
          kind: IDENTIFIER
          pos: 30: 13
        }
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 30: 20
      }
      -rightExpr: CallExpr {
        -callFunc: MemberAccess {
          -baseExpr: RefExpr {
            -identifier: Token {
              value: "buffer"
              kind: IDENTIFIER
              pos: 30: 22
            }
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 30: 28
          }
          -field: Token {
            value: "slice"
            kind: IDENTIFIER
            pos: 30: 29
          }
        }
        -arguments: 0, Argument {
          -expr: LitConstExpr {
            -literal: Token {
              value: "1"
              kind: INTEGER_LITERAL
              pos: 30: 35
            }
          }
        }
        -arguments: 1, Argument {
          -expr: BinaryExpr {
            -leftExpr: MemberAccess {
              -baseExpr: RefExpr {
                -identifier: Token {
                  value: "buffer"
                  kind: IDENTIFIER
                  pos: 30: 38
                }
              }
              -dot: Token {
                value: "."
                kind: DOT
                pos: 30: 44
              }
              -field: Token {
                value: "size"
                kind: IDENTIFIER
                pos: 30: 45
              }
            }
            -op: Token {
              value: "-"
              kind: SUB
              pos: 30: 50
            }
            -rightExpr: LitConstExpr {
              -literal: Token {
                value: "1"
                kind: INTEGER_LITERAL
                pos: 30: 52
              }
            }
          }
        }
      }
    }
    -nodes: 3, AssignExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "endIndex"
          kind: IDENTIFIER
          pos: 31: 13
        }
      }
      -assign: Token {
        value: "-="
        kind: SUB_ASSIGN
        pos: 31: 22
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 31: 25
        }
      }
    }
    -nodes: 4, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 32: 13
      }
      -expr: RefExpr {
        -identifier: Token {
          value: "result"
          kind: IDENTIFIER
          pos: 32: 20
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
