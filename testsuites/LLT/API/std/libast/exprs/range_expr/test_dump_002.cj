/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{parseExpr, RangeExpr, SubscriptExpr, ASTException}

main() {
    let expr = (parseExpr(quote(arr[..])) as SubscriptExpr).getOrThrow()
    expr.dump()
    let rangeExpr = (expr.indexList[0] as RangeExpr).getOrThrow()
    try {
        rangeExpr.start.dump()
    } catch (_: ASTException) {
        println("No start")
    }
    try {
        rangeExpr.end.dump()
    } catch (_: ASTException) {
        println("No end")
    }
    rangeExpr.toTokens() |> println
    rangeExpr.dump()
}

/* SCAN
SubscriptExpr {
  -baseExpr: RefExpr {
    -identifier: Token {
      value: "arr"
      kind: IDENTIFIER
      pos: 15: 33
    }
  }
  -indexList: 0, RangeExpr {
    -op: Token {
      value: ".."
      kind: RANGEOP
      pos: 15: 37
    }
  }
}
No start
No end
..
RangeExpr {
  -op: Token {
    value: ".."
    kind: RANGEOP
    pos: 15: 37
  }
}
*/