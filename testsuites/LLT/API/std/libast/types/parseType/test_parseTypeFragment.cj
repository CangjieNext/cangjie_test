// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let tokens = quote(Int64 String SomeType)
    let (a, b) = parseTypeFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parseTypeFragment(tokens, startFrom: b)
    c.dump()
    println(d)
    let (e, f) = parseTypeFragment(tokens, startFrom: d)
    e.dump()
    println(f)
    return 0;
}

/* SCAN-IN
PrimitiveType {
  -keyword: Token {
    value: "Int64"
    kind: INT64
    pos: 7: 24
  }
}
1
RefType {
  -identifier: Token {
    value: "String"
    kind: IDENTIFIER
    pos: 7: 30
  }
}
2
RefType {
  -identifier: Token {
    value: "SomeType"
    kind: IDENTIFIER
    pos: 7: 37
  }
}
3
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
