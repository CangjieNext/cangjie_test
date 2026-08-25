// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        @When[!debug]
    )
    var anno = Annotation(input)
    anno.dump()
    return 0
}

/* SCAN-IN
Annotation {
  -identifier: When
  -condition: UnaryExpr {
    -op: Token {
      value: "!"
      kind: NOT
      pos: 10: 15
    }
    -expr: RefExpr {
      -identifier: Token {
        value: "debug"
        kind: IDENTIFIER
        pos: 10: 16
      }
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
