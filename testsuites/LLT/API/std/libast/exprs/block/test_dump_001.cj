// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        func test() {
            let a = 10
            var count =  0
            var res = ""
            let arr1 = [1,2,3,4,5]
            let arr2 = [a,a,a,10]
            if (a < 10) {
                a = a + 1
            }
       }
    )
    let fd = match (parseDecl(input) as FuncDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    var block = fd.block

    var b = VarDecl(quote(var b = 2))
    block.nodes.add(b, at: 1)
    block.traverse(myVisitor)
    if (myVisitor.ident.size != 6) {
        return 2
    }
    block.dump()

    return 0
}

/* SCAN-IN
Block {
  -nodes: 0, VarDecl {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 22: 13
    }
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 22: 17
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 22: 19
    }
    -expr: LitConstExpr {
      -literal: Token {
        value: "10"
        kind: INTEGER_LITERAL
        pos: 22: 21
      }
    }
  }
  -nodes: 1, VarDecl {
    -keyword: Token {
      value: "var"
      kind: VAR
      pos: 38: 27
    }
    -identifier: Token {
      value: "b"
      kind: IDENTIFIER
      pos: 38: 31
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 38: 33
    }
    -expr: LitConstExpr {
      -literal: Token {
        value: "2"
        kind: INTEGER_LITERAL
        pos: 38: 35
      }
    }
  }
  -nodes: 2, VarDecl {
    -keyword: Token {
      value: "var"
      kind: VAR
      pos: 23: 13
    }
    -identifier: Token {
      value: "count"
      kind: IDENTIFIER
      pos: 23: 17
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 23: 23
    }
    -expr: LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
        pos: 23: 26
      }
    }
  }
  -nodes: 3, VarDecl {
    -keyword: Token {
      value: "var"
      kind: VAR
      pos: 24: 13
    }
    -identifier: Token {
      value: "res"
      kind: IDENTIFIER
      pos: 24: 17
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 24: 21
    }
    -expr: LitConstExpr {
      -literal: Token {
        value: ""
        kind: STRING_LITERAL
        pos: 24: 23
      }
    }
  }
  -nodes: 4, VarDecl {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 25: 13
    }
    -identifier: Token {
      value: "arr1"
      kind: IDENTIFIER
      pos: 25: 17
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 25: 22
    }
    -expr: ArrayLiteral {
      -elements: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 25: 25
        }
      }
      -elements: 1, LitConstExpr {
        -literal: Token {
          value: "2"
          kind: INTEGER_LITERAL
          pos: 25: 27
        }
      }
      -elements: 2, LitConstExpr {
        -literal: Token {
          value: "3"
          kind: INTEGER_LITERAL
          pos: 25: 29
        }
      }
      -elements: 3, LitConstExpr {
        -literal: Token {
          value: "4"
          kind: INTEGER_LITERAL
          pos: 25: 31
        }
      }
      -elements: 4, LitConstExpr {
        -literal: Token {
          value: "5"
          kind: INTEGER_LITERAL
          pos: 25: 33
        }
      }
    }
  }
  -nodes: 5, VarDecl {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 26: 13
    }
    -identifier: Token {
      value: "arr2"
      kind: IDENTIFIER
      pos: 26: 17
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 26: 22
    }
    -expr: ArrayLiteral {
      -elements: 0, RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 26: 25
        }
      }
      -elements: 1, RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 26: 27
        }
      }
      -elements: 2, RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 26: 29
        }
      }
      -elements: 3, LitConstExpr {
        -literal: Token {
          value: "10"
          kind: INTEGER_LITERAL
          pos: 26: 31
        }
      }
    }
  }
  -nodes: 6, IfExpr {
    -keywordI: Token {
      value: "if"
      kind: IF
      pos: 27: 13
    }
    -condition: BinaryExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 27: 17
        }
      }
      -op: Token {
        value: "<"
        kind: LT
        pos: 27: 19
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "10"
          kind: INTEGER_LITERAL
          pos: 27: 21
        }
      }
    }
    -ifBlock: Block {
      -nodes: 0, AssignExpr {
        -leftExpr: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 28: 17
          }
        }
        -assign: Token {
          value: "="
          kind: ASSIGN
          pos: 28: 19
        }
        -rightExpr: BinaryExpr {
          -leftExpr: RefExpr {
            -identifier: Token {
              value: "a"
              kind: IDENTIFIER
              pos: 28: 21
            }
          }
          -op: Token {
            value: "+"
            kind: ADD
            pos: 28: 23
          }
          -rightExpr: LitConstExpr {
            -literal: Token {
              value: "1"
              kind: INTEGER_LITERAL
              pos: 28: 25
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
