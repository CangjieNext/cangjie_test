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
        (Int64, Int32) -> Array<String>
    )
    let ty = FuncType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        return 2
    }
    ty.dump()
    return 0
}

/* SCAN-IN
FuncType {
  -types: 0, PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 21: 10
    }
  }
  -types: 1, PrimitiveType {
    -keyword: Token {
      value: "Int32"
      kind: INT32
      pos: 21: 17
    }
  }
  -ARROW: Token {
    value: "->"
    kind: ARROW
    pos: 21: 24
  }
  -returnType: RefType {
    -identifier: Token {
      value: "Array"
      kind: IDENTIFIER
      pos: 21: 27
    }
    -typeArguments: 0, RefType {
      -identifier: Token {
        value: "String"
        kind: IDENTIFIER
        pos: 21: 33
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
