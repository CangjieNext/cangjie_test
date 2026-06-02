// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let pattern = EnumPattern(quote(Year(n)))
    pattern.dump()

    if (pattern.lParen.kind == ILLEGAL) {
        return 1
    }

    if (pattern.rParen.kind == ILLEGAL) {
        return 2
    }

    return 0
}

/* SCAN-IN
EnumPattern {
  -constructor: RefExpr {
    -identifier: Token {
      value: "Year"
      kind: IDENTIFIER
      pos: 7: 37
    }
  }
  -patterns: 0, VarOrEnumPattern {
    -identifier: Token {
      value: "n"
      kind: IDENTIFIER
      pos: 7: 42
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
