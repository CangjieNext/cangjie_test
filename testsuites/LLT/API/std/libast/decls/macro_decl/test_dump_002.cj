/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{MacroDecl, Token, ASTException, TokenKind}

main() {
    let decl0 = MacroDecl()
    decl0.colon = Token(COLON)
    try {
        decl0.declType
    } catch (_: ASTException) {
        println("No declType")
    }
    decl0.toTokens() |> println
    decl0.dump()

    let decl1 = MacroDecl(quote(
        public macro foo(input: Tokens) {
            input
        }
    ))
    decl1.colon = Token(COLON).addPosition(0, 0, 0)
    decl1.dump()
    decl1.toTokens() |> println
}

/* SCAN
No declType
()
MacroDecl {
  -block: Block {
  }
}
MacroDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 26: 9
    }
  }
  -keyword: Token {
    value: "macro"
    kind: MACRO
    pos: 26: 16
  }
  -identifier: Token {
    value: "foo"
    kind: IDENTIFIER
    pos: 26: 22
  }
  -funcParams: 0, FuncParam {
    -identifier: Token {
      value: "input"
      kind: IDENTIFIER
      pos: 26: 26
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 26: 31
    }
    -paramType: RefType {
      -identifier: Token {
        value: "Tokens"
        kind: IDENTIFIER
        pos: 26: 33
      }
    }
  }
  -block: Block {
    -nodes: 0, RefExpr {
      -identifier: Token {
        value: "input"
        kind: IDENTIFIER
        pos: 27: 13
      }
    }
  }
}
public macro foo(input: Tokens) {
    input
}

*/