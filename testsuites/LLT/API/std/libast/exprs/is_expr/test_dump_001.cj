// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        ("I" == "am") is Bool
    )

    let isExpr = match (parseExpr(input) as IsExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let expr = isExpr.expr
    let ty = isExpr.shiftType
    if (!(expr is ParenExpr)) {
        return 1
    }
    if (!(ty is PrimitiveType)) {
        return 2
    }
    isExpr.dump()
    0
}

/* SCAN-IN
IsExpr {
  -expr: ParenExpr {
    -expr: BinaryExpr {
      -leftExpr: LitConstExpr {
        -literal: Token {
          value: "I"
          kind: STRING_LITERAL
          pos: 10: 10
        }
      }
      -op: Token {
        value: "=="
        kind: EQUAL
        pos: 10: 14
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "am"
          kind: STRING_LITERAL
          pos: 10: 17
        }
      }
    }
  }
  -keyword: Token {
    value: "is"
    kind: IS
    pos: 10: 23
  }
  -shiftType: PrimitiveType {
    -keyword: Token {
      value: "Bool"
      kind: BOOLEAN
      pos: 10: 26
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
