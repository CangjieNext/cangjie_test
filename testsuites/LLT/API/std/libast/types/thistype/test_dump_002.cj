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
        class Test {
            func self() : This { this }
            func selfArray() { arrayify(self) }
        }
    )
    let ty = (parseDecl(input) as ClassDecl).getOrThrow()
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.dump()
    return 0
}

/* SCAN-IN
ClassDecl {
  -keyword: Token {
    value: "class"
    kind: CLASS
    pos: 21: 9
  }
  -identifier: Token {
    value: "Test"
    kind: IDENTIFIER
    pos: 21: 15
  }
  -body: Body {
    -decls: 0, FuncDecl {
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 22: 13
      }
      -identifier: Token {
        value: "self"
        kind: IDENTIFIER
        pos: 22: 18
      }
      -declType: ThisType {
        -keyword: Token {
          value: "This"
          kind: THISTYPE
          pos: 22: 27
        }
      }
      -block: Block {
        -nodes: 0, RefExpr {
          -identifier: Token {
            value: "this"
            kind: THIS
            pos: 22: 34
          }
        }
      }
    }
    -decls: 1, FuncDecl {
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 23: 13
      }
      -identifier: Token {
        value: "selfArray"
        kind: IDENTIFIER
        pos: 23: 18
      }
      -block: Block {
        -nodes: 0, CallExpr {
          -callFunc: RefExpr {
            -identifier: Token {
              value: "arrayify"
              kind: IDENTIFIER
              pos: 23: 32
            }
          }
          -arguments: 0, Argument {
            -expr: RefExpr {
              -identifier: Token {
                value: "self"
                kind: IDENTIFIER
                pos: 23: 41
              }
            }
          }
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
