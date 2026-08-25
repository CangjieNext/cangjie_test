// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: InterfaceDecl) {
        ident.add(curNode.identifier.value)
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        public interface A <: T1 & T2 & T3 {
            func foo(res: String, count: int64) {
                var a = res
            }
       }
    )
    let interfaceDecl = match (parseDecl(input) as InterfaceDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    interfaceDecl.traverse(myVisitor)
    let modifiers = interfaceDecl.modifiers
    if (modifiers.size != 1) {
        return 1
    }
    if (modifiers[0].keyword.value != "public") {
        return 2
    }

    let output = quote($interfaceDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
    }
    if (myVisitor.ident.size != 2) {
        return 4
    }
    interfaceDecl.dump()
    return 0
}

/* SCAN-IN
InterfaceDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 24: 9
    }
  }
  -keyword: Token {
    value: "interface"
    kind: INTERFACE
    pos: 24: 16
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 24: 26
  }
  -upperBound: Token {
    value: "<:"
    kind: UPPERBOUND
    pos: 24: 28
  }
  -superTypes: 0, RefType {
    -identifier: Token {
      value: "T1"
      kind: IDENTIFIER
      pos: 24: 31
    }
  }
  -superTypes: 1, RefType {
    -identifier: Token {
      value: "T2"
      kind: IDENTIFIER
      pos: 24: 36
    }
  }
  -superTypes: 2, RefType {
    -identifier: Token {
      value: "T3"
      kind: IDENTIFIER
      pos: 24: 41
    }
  }
  -body: Body {
    -decls: 0, FuncDecl {
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 25: 13
      }
      -identifier: Token {
        value: "foo"
        kind: IDENTIFIER
        pos: 25: 18
      }
      -funcParams: 0, FuncParam {
        -identifier: Token {
          value: "res"
          kind: IDENTIFIER
          pos: 25: 22
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 25: 25
        }
        -paramType: RefType {
          -identifier: Token {
            value: "String"
            kind: IDENTIFIER
            pos: 25: 27
          }
        }
      }
      -funcParams: 1, FuncParam {
        -identifier: Token {
          value: "count"
          kind: IDENTIFIER
          pos: 25: 35
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 25: 40
        }
        -paramType: RefType {
          -identifier: Token {
            value: "int64"
            kind: IDENTIFIER
            pos: 25: 42
          }
        }
      }
      -block: Block {
        -nodes: 0, VarDecl {
          -keyword: Token {
            value: "var"
            kind: VAR
            pos: 26: 17
          }
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 26: 21
          }
          -assign: Token {
            value: "="
            kind: ASSIGN
            pos: 26: 23
          }
          -expr: RefExpr {
            -identifier: Token {
              value: "res"
              kind: IDENTIFIER
              pos: 26: 25
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
