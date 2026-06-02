/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.MacroExpandExpr

main() {
    let expr = MacroExpandExpr()
    expr.dump()
    let macroExpandExpr = MacroExpandExpr(quote(@M class A {}))
    macroExpandExpr.toTokens() |> println
    macroExpandExpr.dump()
}

/* SCAN
MacroExpandExpr {
}
@M
class A {
}

MacroExpandExpr {
  -packageIdentifier: Token {
    value: "M"
    kind: IDENTIFIER
    pos: 17: 50
  }
  -identifier: Token {
    value: "M"
    kind: IDENTIFIER
    pos: 17: 50
  }
  -macroInputs:0: Token {
    value: "class"
    kind: CLASS
    pos: 17: 52
  }
  -macroInputs:1: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 17: 58
  }
  -macroInputs:2: Token {
    value: "{"
    kind: LCURL
    pos: 17: 60
  }
  -macroInputs:3: Token {
    value: "}"
    kind: RCURL
    pos: 17: 61
  }
}
*/