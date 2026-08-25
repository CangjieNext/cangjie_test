// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

import std.ast.*

main() {
    var input: Tokens = quote(public func foo<T>(@!Anno["仓颉"] a: Int64) {
    a
})
    let decl = parseDecl(input)
    if (let Some(_decl) <- (decl as FuncDecl)) {
        _decl.funcParams[0].dump()
        return 0
    }
    return 1
}

/* SCAN-IN
FuncParam {
  -annotations: 0, Annotation {
    -identifier: Anno
    -arguments: 0, Argument {
      -expr: LitConstExpr {
        -literal: Token {
          value: "仓颉"
          kind: STRING_LITERAL
          pos: 9: 57
        }
      }
    }
  }
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 9: 67
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 9: 68
  }
  -paramType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 9: 70
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
