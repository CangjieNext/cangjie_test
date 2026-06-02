/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{MatchExpr, Tokens}

main() {
    let expr = MatchExpr(quote(
        match (x) {
            case 1 | 2 => 0
            case _ => 1
        }
    ))
    let matchCase = expr.matchCases[0]
    matchCase.bitOrs = Tokens()
    matchCase.toTokens() |> println
    matchCase.dump()
}

/* SCAN
case 1 | 2 => 0

MatchCase {
  -keywordC: Token {
    value: "case"
    kind: CASE
    pos: 17: 13
  }
  -patterns: 0, ConstPattern {
    -litConstExpr: LitConstExpr {
      -literal: Token {
        value: "1"
        kind: INTEGER_LITERAL
        pos: 17: 18
      }
    }
  }
  -patterns: 1, ConstPattern {
    -litConstExpr: LitConstExpr {
      -literal: Token {
        value: "2"
        kind: INTEGER_LITERAL
        pos: 17: 22
      }
    }
  }
  -arrow: Token {
    value: "=>"
    kind: DOUBLE_ARROW
    pos: 17: 24
  }
  -block: Block {
    -nodes: 0, LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
        pos: 17: 27
      }
    }
  }
}
*/