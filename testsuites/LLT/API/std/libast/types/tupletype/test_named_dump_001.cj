// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let input = quote(
        (x: Int64, y: (Int32, Float64))
    )
    let ty = TupleType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.dump()
    return 0
}

/* SCAN-IN
TupleType {
  -types: 0, PrimitiveType {
    -typeParameterName: Token {
      value: "x"
      kind: IDENTIFIER
      pos: 11: 10
    }
    -COLON: Token {
      value: ":"
      kind: COLON
      pos: 11: 11
    }
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 11: 13
    }
  }
  -types: 1, TupleType {
    -typeParameterName: Token {
      value: "y"
      kind: IDENTIFIER
      pos: 11: 20
    }
    -COLON: Token {
      value: ":"
      kind: COLON
      pos: 11: 21
    }
    -types: 0, PrimitiveType {
      -keyword: Token {
        value: "Int32"
        kind: INT32
        pos: 11: 24
      }
    }
    -types: 1, PrimitiveType {
      -keyword: Token {
        value: "Float64"
        kind: FLOAT64
        pos: 11: 31
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
