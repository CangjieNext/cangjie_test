// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public func foo(a: Int32, b: T, c!: Int32 = 42) : Int32 {
            if ( a > 100 ) {
                return 42
            }
            let d = a + c
            return d
        }
    )
    let fd = parseDecl(input) as FuncDecl
    var funcDecl = match (fd) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($funcDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    // Test identifier.
    if (funcDecl.identifier.value != "foo") {
        return 2
    }
    // Test return type.
    let ty = funcDecl.declType
    // Test modifiers.
    let modifiers = funcDecl.modifiers
    if (modifiers.size != 1) {
        return 3
    }
    if (modifiers[0].keyword.value != "public") {
        return -1
    }
    var newDecl = VarDecl(quote(var e = 1))
    funcDecl.declType = PrimitiveType(quote(Int64))
    funcDecl.block.nodes.add(newDecl, at: 1)
    funcDecl.dump()
    return 0
}

/* SCAN-IN
FuncDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 10: 9
    }
  }
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 10: 16
  }
  -identifier: Token {
    value: "foo"
    kind: IDENTIFIER
    pos: 10: 21
  }
  -funcParams: 0, FuncParam {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 10: 25
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 10: 26
    }
    -paramType: PrimitiveType {
      -keyword: Token {
        value: "Int32"
        kind: INT32
        pos: 10: 28
      }
    }
  }
  -funcParams: 1, FuncParam {
    -identifier: Token {
      value: "b"
      kind: IDENTIFIER
      pos: 10: 35
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 10: 36
    }
    -paramType: RefType {
      -identifier: Token {
        value: "T"
        kind: IDENTIFIER
        pos: 10: 38
      }
    }
  }
  -funcParams: 2, FuncParam {
    -identifier: Token {
      value: "c"
      kind: IDENTIFIER
      pos: 10: 41
    }
    -not: Token {
      value: "!"
      kind: NOT
      pos: 10: 42
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 10: 43
    }
    -paramType: PrimitiveType {
      -keyword: Token {
        value: "Int32"
        kind: INT32
        pos: 10: 45
      }
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 10: 51
    }
    -expr: LitConstExpr {
      -literal: Token {
        value: "42"
        kind: INTEGER_LITERAL
        pos: 10: 53
      }
    }
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 44: 45
    }
  }
  -block: Block {
    -nodes: 0, IfExpr {
      -keywordI: Token {
        value: "if"
        kind: IF
        pos: 11: 13
      }
      -condition: BinaryExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 11: 18
          }
        }
        -op: Token {
          value: ">"
          kind: GT
          pos: 11: 20
        }
        -rightExpr: LitConstExpr {
          -literal: Token {
            value: "100"
            kind: INTEGER_LITERAL
            pos: 11: 22
          }
        }
      }
      -ifBlock: Block {
        -nodes: 0, ReturnExpr {
          -keyword: Token {
            value: "return"
            kind: RETURN
            pos: 12: 17
          }
          -expr: LitConstExpr {
            -literal: Token {
              value: "42"
              kind: INTEGER_LITERAL
              pos: 12: 24
            }
          }
        }
      }
    }
    -nodes: 1, VarDecl {
      -keyword: Token {
        value: "var"
        kind: VAR
        pos: 43: 33
      }
      -identifier: Token {
        value: "e"
        kind: IDENTIFIER
        pos: 43: 37
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 43: 39
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 43: 41
        }
      }
    }
    -nodes: 2, VarDecl {
      -keyword: Token {
        value: "let"
        kind: LET
        pos: 14: 13
      }
      -identifier: Token {
        value: "d"
        kind: IDENTIFIER
        pos: 14: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 14: 19
      }
      -expr: BinaryExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 14: 21
          }
        }
        -op: Token {
          value: "+"
          kind: ADD
          pos: 14: 23
        }
        -rightExpr: RefExpr {
          -identifier: Token {
            value: "c"
            kind: IDENTIFIER
            pos: 14: 25
          }
        }
      }
    }
    -nodes: 3, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 15: 13
      }
      -expr: RefExpr {
        -identifier: Token {
          value: "d"
          kind: IDENTIFIER
          pos: 15: 20
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
