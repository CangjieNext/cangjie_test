// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let quoteExpr = QuoteExpr(quote(quote(a + 1)))
    quoteExpr.exprs[0].dump()
    return 0
}

/* SCAN
QuoteToken {
  -tokens[0]: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 8: 43
  }
  -tokens[1]: Token {
    value: "+"
    kind: ADD
    pos: 8: 45
  }
  -tokens[2]: Token {
    value: "1"
    kind: INTEGER_LITERAL
    pos: 8: 47
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