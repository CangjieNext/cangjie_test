/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.ReturnExpr

main() {
    let returnExpr = ReturnExpr()
    returnExpr.dump()
}

/* SCAN
ReturnExpr {
  -keyword: Token {
    value: "return"
    kind: RETURN
  }
}
*/