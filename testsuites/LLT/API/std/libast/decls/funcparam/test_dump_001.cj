// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main(): Int64 {
    let tokens = quote(
        add!: (Int64, Int64) -> Int64 = {a, b => 10}
    )
    let funParam = FuncParam(tokens)
    funParam.dump()
    return 0
}

/* SCAN-IN
FuncParam {
  -identifier: Token {
    value: "add"
    kind: IDENTIFIER
    pos: 7: 9
  }
  -not: Token {
    value: "!"
    kind: NOT
    pos: 7: 12
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 7: 13
  }
  -paramType: FuncType {
    -types: 0, PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 7: 16
      }
    }
    -types: 1, PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 7: 23
      }
    }
    -ARROW: Token {
      value: "->"
      kind: ARROW
      pos: 7: 30
    }
    -returnType: PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 7: 33
      }
    }
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 7: 39
  }
  -expr: LambdaExpr {
    -funcParams: 0, FuncParam {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 7: 42
      }
      -paramType:     }
    -funcParams: 1, FuncParam {
      -identifier: Token {
        value: "b"
        kind: IDENTIFIER
        pos: 7: 45
      }
      -paramType:     }
    -doubleArrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 7: 47
    }
    -nodes: 0, LitConstExpr {
      -literal: Token {
        value: "10"
        kind: INTEGER_LITERAL
        pos: 7: 50
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
