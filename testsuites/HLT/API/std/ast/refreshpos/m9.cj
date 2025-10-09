/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (CJNATIVE) DEPENDENCE: define.cj
// (CJNATIVE) EXEC: %compiler %cmp_macro define.cj
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.ast.*
import def.*

main() {
    @M9(var a:Int32 = 1)
}

/* SCAN-IN
VarDecl {
  -keyword: Token {
    value: "var"
    kind: VAR
    pos: 18: 9
  }
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 18: 13
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int32"
      kind: INT32
      pos: 18: 15
    }
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 18: 21
  }
  -expr: LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 18: 23
    }
  }
}
 */
