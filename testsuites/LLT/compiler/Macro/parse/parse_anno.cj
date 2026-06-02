// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    var tks = quote()
    tks.append(Token(TokenKind.AT))
    tks.append(Token(TokenKind.IDENTIFIER, "Anno"))
    //[
    tks.append(Token(TokenKind.LSQUARE))
    tks.append(Token(TokenKind.INTEGER_LITERAL, "5"))
    //]
    tks.append(Token(TokenKind.RSQUARE))
    tks += quote(var a = 1)
    let decl = parseDecl(tks)
    decl.dump()
}

/* SCAN
MacroExpandDecl {
  -identifier: Token {
    value: "Anno"
    kind: IDENTIFIER
    pos: 9: 16
  }
  -macroAttrs 0: Token {
    value: "5"
    kind: INTEGER_LITERAL
    pos: 12: 16
  }
  -macroInputs 0: Token {
    value: "var"
    kind: VAR
    pos: 15: 18
  }
  -macroInputs 1: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 15: 22
  }
  -macroInputs 2: Token {
    value: "="
    kind: ASSIGN
    pos: 15: 24
  }
  -macroInputs 3: Token {
    value: "1"
    kind: INTEGER_LITERAL
    pos: 15: 26
  }
  -macroInputDecl: VarDecl {
    -keyword: Token {
      value: "var"
      kind: VAR
      pos: 15: 18
    }
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 15: 22
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 15: 24
    }
    -expr: LitConstExpr {
      -literal: Token {
        value: "1"
        kind: INTEGER_LITERAL
        pos: 15: 26
      }
    }
  }
}
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

