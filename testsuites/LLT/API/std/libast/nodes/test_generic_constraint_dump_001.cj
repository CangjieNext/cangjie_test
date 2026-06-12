/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{ClassDecl, GenericConstraint}
internal import std.collection.ArrayList

main() {
    let decl = ClassDecl(quote(
        class A <K> where K <: A & B {}
    ))
    let gc = decl.genericConstraint[0]
    gc.upperBounds.clear()
    gc.toTokens() |> println
    gc.dump()
}

/* SCAN
where K <:
GenericConstraint {
  -keyword: Token {
    value: "where"
    kind: WHERE
    pos: 17: 21
  }
  -typeArgument: RefType {
    -identifier: Token {
      value: "K"
      kind: IDENTIFIER
      pos: 17: 27
    }
  }
  -upperBound: Token {
    value: "<:"
    kind: UPPERBOUND
    pos: 17: 29
  }
}
*/