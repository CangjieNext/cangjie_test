/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.SubscriptExpr

main() {
    let subscriptExpr = SubscriptExpr(quote(a[1, 2]))
    subscriptExpr.toTokens() |> println
    subscriptExpr.dump()
}

/* SCAN
a[1, 2]
SubscriptExpr {
  -baseExpr: RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 15: 45
    }
  }
  -indexList: 0, LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 15: 47
    }
  }
  -indexList: 1, LitConstExpr {
    -literal: Token {
      value: "2"
      kind: INTEGER_LITERAL
      pos: 15: 50
    }
  }
}
*/