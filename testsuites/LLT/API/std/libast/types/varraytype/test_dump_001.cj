// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: PrimitiveType) {
        ident.add(curNode.keyword.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        VArray<Int32, \$10>
    )
    let ty = VArrayType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.dump()
    return 0
}

/* SCAN-IN
VArrayType {
  -VARRAY: Token {
    value: "VArray"
    kind: VARRAY
    pos: 21: 9
  }
  -elementTy: PrimitiveType {
    -keyword: Token {
      value: "Int32"
      kind: INT32
      pos: 21: 16
    }
  }
  -dollar: Token {
    value: "$"
    kind: DOLLAR
    pos: 21: 24
  }
  -size: Token {
    value: "10"
    kind: INTEGER_LITERAL
    pos: 21: 25
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
