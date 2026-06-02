// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main(): Int64 {
    let tokens = quote(var a: Int64;;var ac: Int64;

    ;;;class A{};;struct B{})
    let (a, b) = parseDeclFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parseDeclFragment(tokens, startFrom: b)
    c.dump()
    println(d)
    let (e, f) = parseDeclFragment(tokens, startFrom: d)
    e.dump()
    println(f)
    return 0;
}

/* SCAN-IN
VarDecl {
  -keyword: Token {
    value: "var"
    kind: VAR
    pos: 7: 24
  }
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 7: 28
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 7: 31
    }
  }
}
4
VarDecl {
  -keyword: Token {
    value: "var"
    kind: VAR
    pos: 7: 38
  }
  -identifier: Token {
    value: "ac"
    kind: IDENTIFIER
    pos: 7: 42
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 7: 46
    }
  }
}
10
ClassDecl {
  -keyword: Token {
    value: "class"
    kind: CLASS
    pos: 9: 8
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 9: 14
  }
  -body: Body {
  }
}
20
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
