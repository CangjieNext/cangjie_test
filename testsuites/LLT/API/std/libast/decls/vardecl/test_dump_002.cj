// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    var newVd = VarDecl()
    newVd.keyword = Token(TokenKind.VAR)
    newVd.identifier = Token(TokenKind.IDENTIFIER, "test")
    newVd.assign = Token(TokenKind.ASSIGN)
    newVd.expr = RefExpr(quote(a))
    if (newVd.toTokens().size == 0) {
        return 1
    }
    newVd.dump()
    return 0
}

/* SCAN-IN
VarDecl {
  -keyword: Token {
    value: "var"
    kind: VAR
    pos: 10: 21
  }
  -identifier: Token {
    value: "test"
    kind: IDENTIFIER
    pos: 11: 24
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 12: 20
  }
  -expr: RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 13: 32
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
