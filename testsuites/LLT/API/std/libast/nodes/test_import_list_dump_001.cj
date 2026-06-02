/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{ImportList, Token}

main() {
    let importList0 = ImportList(quote(import std.ast.*))
    importList0.toTokens() |> println

    let importList1 = ImportList(quote(public import std.ast.*))
    importList1.modifier = Token()
    importList1.dump()
    importList1.toTokens() |> println
}

/* SCAN
import std.ast.*

ImportList {
  -keywordI: Token {
    value: "import"
    kind: IMPORT
    pos: 18: 47
  }
  -importKind: All
  prefixPath: 0: Token {
    value: "std"
    kind: IDENTIFIER
    pos: 18: 54
  }
  prefixPath: 1: Token {
    value: "ast"
    kind: IDENTIFIER
    pos: 18: 58
  }
  -identifier: Token {
    value: "*"
    kind: MUL
    pos: 18: 62
  }
}
import std.ast.*

*/