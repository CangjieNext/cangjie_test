// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: FuncDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        public mut prop b: Int64 {
            get() {
                return a
            }
            set(value) {
                a = value
            }
        }
    )
    let propDecl = match (parseDecl(input) as PropDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    propDecl.traverse(myVisitor)
    if (myVisitor.ident.size != 2) {
        return 1
    }
    propDecl.dump()
    return 0
}

/* SCAN-IN
PropDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 20: 9
    }
  }
  -modifiers: 1, Modifier {
    -keyword: Token {
      value: "mut"
      kind: MUT
      pos: 20: 16
    }
  }
  -keyword: Token {
    value: "prop"
    kind: PROP
    pos: 20: 20
  }
  -identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 20: 25
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 20: 28
    }
  }
  -getter: FuncDecl {
    -identifier: Token {
      value: "get"
      kind: IDENTIFIER
      pos: 21: 13
    }
    -block: Block {
      -nodes: 0, ReturnExpr {
        -keyword: Token {
          value: "return"
          kind: RETURN
          pos: 22: 17
        }
        -expr: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 22: 24
          }
        }
      }
    }
  }
  -setter: FuncDecl {
    -identifier: Token {
      value: "set"
      kind: IDENTIFIER
      pos: 24: 13
    }
    -funcParams: 0, FuncParam {
      -identifier: Token {
        value: "value"
        kind: IDENTIFIER
        pos: 24: 17
      }
      -paramType:     }
    -block: Block {
      -nodes: 0, AssignExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 25: 17
          }
        }
        -assign: Token {
          value: "="
          kind: ASSIGN
          pos: 25: 19
        }
        -rightExpr: RefExpr {
          -identifier: Token {
            value: "value"
            kind: IDENTIFIER
            pos: 25: 21
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
