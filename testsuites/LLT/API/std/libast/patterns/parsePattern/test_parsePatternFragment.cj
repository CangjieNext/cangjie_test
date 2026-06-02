// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let tokens = quote(Year(n) RED _)
    let (a, b) = parsePatternFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parsePatternFragment(tokens, startFrom: b)
    c.dump()
    println(d)
    let (e, f) = parsePatternFragment(tokens, startFrom: d)
    e.dump()
    println(f)
    return 0;
}

/* SCAN-IN
EnumPattern {
  -constructor: RefExpr {
    -identifier: Token {
      value: "Year"
      kind: IDENTIFIER
      pos: 7: 24
    }
  }
  -patterns: 0, VarOrEnumPattern {
    -identifier: Token {
      value: "n"
      kind: IDENTIFIER
      pos: 7: 29
    }
  }
}
4
VarOrEnumPattern {
  -identifier: Token {
    value: "RED"
    kind: IDENTIFIER
    pos: 7: 32
  }
}
5
WildcardPattern {
  -wildcard: Token {
    value: "_"
    kind: WILDCARD
    pos: 7: 36
  }
}
6
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
