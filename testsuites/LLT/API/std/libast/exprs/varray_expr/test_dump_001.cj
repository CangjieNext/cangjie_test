// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        let arr: VArray<Int64, \$5> = VArray<Int64, \$5> { i => i}
    )
    let decl = match (parseDecl(input) as VarDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, decl.toTokens())
    if (!flag) {
        return 1
    }
    decl.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 2
    }
    decl.dump()

    return 0
}

/* SCAN-IN
VarDecl {
  -keyword: Token {
    value: "let"
    kind: LET
    pos: 21: 9
  }
  -identifier: Token {
    value: "arr"
    kind: IDENTIFIER
    pos: 21: 13
  }
  -declType: VArrayType {
    -VARRAY: Token {
      value: "VArray"
      kind: VARRAY
      pos: 21: 18
    }
    -elementTy: PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 21: 25
      }
    }
    -dollar: Token {
      value: "$"
      kind: DOLLAR
      pos: 21: 33
    }
    -size: Token {
      value: "5"
      kind: INTEGER_LITERAL
      pos: 21: 34
    }
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 21: 37
  }
  -expr: TrailingClosureExpr {
    -expr: VArrayExpr {
      -vArrayType: VArrayType {
        -VARRAY: Token {
          value: "VArray"
          kind: VARRAY
          pos: 21: 39
        }
        -elementTy: PrimitiveType {
          -keyword: Token {
            value: "Int64"
            kind: INT64
            pos: 21: 46
          }
        }
        -dollar: Token {
          value: "$"
          kind: DOLLAR
          pos: 21: 54
        }
        -size: Token {
          value: "5"
          kind: INTEGER_LITERAL
          pos: 21: 55
        }
      }
    }
    -lambdaExpr: LambdaExpr {
      -funcParams: 0, FuncParam {
        -identifier: Token {
          value: "i"
          kind: IDENTIFIER
          pos: 21: 60
        }
        -paramType:       }
      -doubleArrow: Token {
        value: "=>"
        kind: DOUBLE_ARROW
        pos: 21: 62
      }
      -nodes: 0, RefExpr {
        -identifier: Token {
          value: "i"
          kind: IDENTIFIER
          pos: 21: 65
        }
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
