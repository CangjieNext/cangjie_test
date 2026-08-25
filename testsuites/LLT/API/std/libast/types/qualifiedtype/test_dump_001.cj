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
        A.b<Int64, String>
    )
    let ty = QualifiedType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 2
    }
    if (ty.typeArguments.size != 2) {
        return 3
    }
    ty.dump()
    return 0
}

/* SCAN-IN
QualifiedType {
  -baseType: RefType {
    -identifier: Token {
      value: "A"
      kind: IDENTIFIER
      pos: 21: 9
    }
  }
  identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 21: 11
  }
  typeArguments: 0, PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 21: 13
    }
  }
  typeArguments: 1, RefType {
    -identifier: Token {
      value: "String"
      kind: IDENTIFIER
      pos: 21: 20
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
