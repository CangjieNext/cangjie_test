// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: StructDecl) {
        ident.add(curNode.identifier.value)
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
    public override func visit(curNode: LitConstExpr) {
        ident.add(curNode.literal.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        public struct A<T> <: T1 & T2 & T3 where T <: Comparable<T> & ToString {
            let a = 10
            var count = 0
            var res = ""
            let arr1 = [1,2,3,4,5]
            let arr2 = [a,a,a,10]

            init(res: String, count: int64) {
                super(res, count)
                this.res = res
                this.count = count
            }
       }
    )
    let structDecl = match (parseDecl(input) as StructDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    structDecl.traverse(myVisitor)
    let modifiers = structDecl.modifiers
    if (modifiers.size != 1) {
        return 1
    }
    if (modifiers[0].keyword.value != "public") {
        return 2
    }

    let output = quote($structDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
    }
    if (myVisitor.ident.size != 6) {
        return 4
    }
    structDecl.dump()
    return 0
}

/* SCAN-IN
StructDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 27: 9
    }
  }
  -keyword: Token {
    value: "struct"
    kind: STRUCT
    pos: 27: 16
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 27: 23
  }
  -genericParam: GenericParam {
    -parameters: 0, T: Token {
      value: "T"
      kind: IDENTIFIER
      pos: 27: 25
    }
  }
  -upperBound: Token {
    value: "<:"
    kind: UPPERBOUND
    pos: 27: 28
  }
  -superTypes: 0, RefType {
    -identifier: Token {
      value: "T1"
      kind: IDENTIFIER
      pos: 27: 31
    }
  }
  -superTypes: 1, RefType {
    -identifier: Token {
      value: "T2"
      kind: IDENTIFIER
      pos: 27: 36
    }
  }
  -superTypes: 2, RefType {
    -identifier: Token {
      value: "T3"
      kind: IDENTIFIER
      pos: 27: 41
    }
  }
  -genericConstraint: 0, GenericConstraint {
    -keyword: Token {
      value: "where"
      kind: WHERE
      pos: 27: 44
    }
    -typeArgument: RefType {
      -identifier: Token {
        value: "T"
        kind: IDENTIFIER
        pos: 27: 50
      }
    }
    -upperBound: Token {
      value: "<:"
      kind: UPPERBOUND
      pos: 27: 52
    }
    -upperBounds: 0, RefType {
      -identifier: Token {
        value: "Comparable"
        kind: IDENTIFIER
        pos: 27: 55
      }
      -typeArguments: 0, RefType {
        -identifier: Token {
          value: "T"
          kind: IDENTIFIER
          pos: 27: 66
        }
      }
    }
    -upperBounds: 1, RefType {
      -identifier: Token {
        value: "ToString"
        kind: IDENTIFIER
        pos: 27: 71
      }
    }
  }
  -body: Body {
    -decls: 0, VarDecl {
      -keyword: Token {
        value: "let"
        kind: LET
        pos: 28: 13
      }
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 28: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 28: 19
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "10"
          kind: INTEGER_LITERAL
          pos: 28: 21
        }
      }
    }
    -decls: 1, VarDecl {
      -keyword: Token {
        value: "var"
        kind: VAR
        pos: 29: 13
      }
      -identifier: Token {
        value: "count"
        kind: IDENTIFIER
        pos: 29: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 29: 23
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "0"
          kind: INTEGER_LITERAL
          pos: 29: 25
        }
      }
    }
    -decls: 2, VarDecl {
      -keyword: Token {
        value: "var"
        kind: VAR
        pos: 30: 13
      }
      -identifier: Token {
        value: "res"
        kind: IDENTIFIER
        pos: 30: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 30: 21
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: ""
          kind: STRING_LITERAL
          pos: 30: 23
        }
      }
    }
    -decls: 3, VarDecl {
      -keyword: Token {
        value: "let"
        kind: LET
        pos: 31: 13
      }
      -identifier: Token {
        value: "arr1"
        kind: IDENTIFIER
        pos: 31: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 31: 22
      }
      -expr: ArrayLiteral {
        -elements: 0, LitConstExpr {
          -literal: Token {
            value: "1"
            kind: INTEGER_LITERAL
            pos: 31: 25
          }
        }
        -elements: 1, LitConstExpr {
          -literal: Token {
            value: "2"
            kind: INTEGER_LITERAL
            pos: 31: 27
          }
        }
        -elements: 2, LitConstExpr {
          -literal: Token {
            value: "3"
            kind: INTEGER_LITERAL
            pos: 31: 29
          }
        }
        -elements: 3, LitConstExpr {
          -literal: Token {
            value: "4"
            kind: INTEGER_LITERAL
            pos: 31: 31
          }
        }
        -elements: 4, LitConstExpr {
          -literal: Token {
            value: "5"
            kind: INTEGER_LITERAL
            pos: 31: 33
          }
        }
      }
    }
    -decls: 4, VarDecl {
      -keyword: Token {
        value: "let"
        kind: LET
        pos: 32: 13
      }
      -identifier: Token {
        value: "arr2"
        kind: IDENTIFIER
        pos: 32: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 32: 22
      }
      -expr: ArrayLiteral {
        -elements: 0, RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 32: 25
          }
        }
        -elements: 1, RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 32: 27
          }
        }
        -elements: 2, RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 32: 29
          }
        }
        -elements: 3, LitConstExpr {
          -literal: Token {
            value: "10"
            kind: INTEGER_LITERAL
            pos: 32: 31
          }
        }
      }
    }
    -decls: 5, FuncDecl {
      -keyword: Token {
        value: "init"
        kind: INIT
        pos: 34: 13
      }
      -identifier: Token {
        value: "init"
        kind: IDENTIFIER
        pos: 34: 13
      }
      -funcParams: 0, FuncParam {
        -identifier: Token {
          value: "res"
          kind: IDENTIFIER
          pos: 34: 18
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 34: 21
        }
        -paramType: RefType {
          -identifier: Token {
            value: "String"
            kind: IDENTIFIER
            pos: 34: 23
          }
        }
      }
      -funcParams: 1, FuncParam {
        -identifier: Token {
          value: "count"
          kind: IDENTIFIER
          pos: 34: 31
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 34: 36
        }
        -paramType: RefType {
          -identifier: Token {
            value: "int64"
            kind: IDENTIFIER
            pos: 34: 38
          }
        }
      }
      -block: Block {
        -nodes: 0, CallExpr {
          -callFunc: RefExpr {
            -identifier: Token {
              value: "super"
              kind: SUPER
              pos: 35: 17
            }
          }
          -arguments: 0, Argument {
            -expr: RefExpr {
              -identifier: Token {
                value: "res"
                kind: IDENTIFIER
                pos: 35: 23
              }
            }
          }
          -arguments: 1, Argument {
            -expr: RefExpr {
              -identifier: Token {
                value: "count"
                kind: IDENTIFIER
                pos: 35: 28
              }
            }
          }
        }
        -nodes: 1, AssignExpr {
          -leftExpr: MemberAccess {
            -baseExpr: RefExpr {
              -identifier: Token {
                value: "this"
                kind: THIS
                pos: 36: 17
              }
            }
            -dot: Token {
              value: "."
              kind: DOT
              pos: 36: 21
            }
            -field: Token {
              value: "res"
              kind: IDENTIFIER
              pos: 36: 22
            }
          }
          -assign: Token {
            value: "="
            kind: ASSIGN
            pos: 36: 26
          }
          -rightExpr: RefExpr {
            -identifier: Token {
              value: "res"
              kind: IDENTIFIER
              pos: 36: 28
            }
          }
        }
        -nodes: 2, AssignExpr {
          -leftExpr: MemberAccess {
            -baseExpr: RefExpr {
              -identifier: Token {
                value: "this"
                kind: THIS
                pos: 37: 17
              }
            }
            -dot: Token {
              value: "."
              kind: DOT
              pos: 37: 21
            }
            -field: Token {
              value: "count"
              kind: IDENTIFIER
              pos: 37: 22
            }
          }
          -assign: Token {
            value: "="
            kind: ASSIGN
            pos: 37: 28
          }
          -rightExpr: RefExpr {
            -identifier: Token {
              value: "count"
              kind: IDENTIFIER
              pos: 37: 30
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
