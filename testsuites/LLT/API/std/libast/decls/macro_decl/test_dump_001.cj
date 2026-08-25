// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public macro M(input: Tokens, attrs: Tokens) : Tokens {
            parseDecl(input) as Funcdecl
            return input + attrs
        }
    )
    let md = parseDecl(input) as MacroDecl
    var macroDecl = match (md) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($macroDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    // Test identifier.
    if (macroDecl.keyword.value != "macro") {
        return 2
    }
    // Test return type.
    let ty = macroDecl.declType
    if (!(ty is RefType)) {
        return 3
    }

    // Test modifiers.
    let modifiers = macroDecl.modifiers
    if (modifiers.size != 1) {
        return 4
    }

    macroDecl.dump()
    return 0
}

/* SCAN-IN
MacroDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 10: 9
    }
  }
  -keyword: Token {
    value: "macro"
    kind: MACRO
    pos: 10: 16
  }
  -identifier: Token {
    value: "M"
    kind: IDENTIFIER
    pos: 10: 22
  }
  -funcParams: 0, FuncParam {
    -identifier: Token {
      value: "input"
      kind: IDENTIFIER
      pos: 10: 24
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 10: 29
    }
    -paramType: RefType {
      -identifier: Token {
        value: "Tokens"
        kind: IDENTIFIER
        pos: 10: 31
      }
    }
  }
  -funcParams: 1, FuncParam {
    -identifier: Token {
      value: "attrs"
      kind: IDENTIFIER
      pos: 10: 39
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 10: 44
    }
    -paramType: RefType {
      -identifier: Token {
        value: "Tokens"
        kind: IDENTIFIER
        pos: 10: 46
      }
    }
  }
  -declType: RefType {
    -identifier: Token {
      value: "Tokens"
      kind: IDENTIFIER
      pos: 10: 56
    }
  }
  -block: Block {
    -nodes: 0, AsExpr {
      -expr: CallExpr {
        -callFunc: RefExpr {
          -identifier: Token {
            value: "parseDecl"
            kind: IDENTIFIER
            pos: 11: 13
          }
        }
        -arguments: 0, Argument {
          -expr: RefExpr {
            -identifier: Token {
              value: "input"
              kind: IDENTIFIER
              pos: 11: 23
            }
          }
        }
      }
      -keyword: Token {
        value: "as"
        kind: AS
        pos: 11: 30
      }
      -shiftType: RefType {
        -identifier: Token {
          value: "Funcdecl"
          kind: IDENTIFIER
          pos: 11: 33
        }
      }
    }
    -nodes: 1, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 12: 13
      }
      -expr: BinaryExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "input"
            kind: IDENTIFIER
            pos: 12: 20
          }
        }
        -op: Token {
          value: "+"
          kind: ADD
          pos: 12: 26
        }
        -rightExpr: RefExpr {
          -identifier: Token {
            value: "attrs"
            kind: IDENTIFIER
            pos: 12: 28
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
