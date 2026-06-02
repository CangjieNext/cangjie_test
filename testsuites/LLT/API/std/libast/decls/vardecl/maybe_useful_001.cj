// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main(): Int64 {
    let opTokens = quote(
        const (a,b) = (1, 2)
    )
    let opExpr = parseDecl(opTokens)
    var a = (opExpr as VarDecl).getOrThrow()
    a.keyword.toTokens().dump()
    a.dump()
    return 0
}

/* SCAN-IN
description: const, token_id: 93, token_literal_value: const, fileID: 1, line: 8, column: 9
VarDecl {
  -keyword: Token {
    value: "const"
    kind: CONST
    pos: 8: 9
  }
  -pattern: TuplePattern {
    -patterns: 0, VarPattern {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 8: 16
      }
    }
    -patterns: 1, VarPattern {
      -identifier: Token {
        value: "b"
        kind: IDENTIFIER
        pos: 8: 18
      }
    }
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 8: 21
  }
  -expr: TupleLiteral {
    -elements: 0, LitConstExpr {
      -literal: Token {
        value: "1"
        kind: INTEGER_LITERAL
        pos: 8: 24
      }
    }
    -elements: 1, LitConstExpr {
      -literal: Token {
        value: "2"
        kind: INTEGER_LITERAL
        pos: 8: 27
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
