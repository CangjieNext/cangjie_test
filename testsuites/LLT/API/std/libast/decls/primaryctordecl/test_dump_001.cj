// DEPENDENCE: %n.expect
// EXEC: %compiler %coverage_opt %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: ClassDecl) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
    public override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        @When[os == "Linux"]
        @C
        private const Rectangle(let width: Int64, let height: Int64) {
            this.width = 10
            this.height = 10
        }
    )
    let primaryCtor = match (parseDecl(input, astKind: "PrimaryCtorDecl") as PrimaryCtorDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    primaryCtor.traverse(myVisitor)

    // test annotations
    let annotations = primaryCtor.annotations
    if (annotations.size != 2) {
        return 1
    }
    if (annotations[0].identifier.value != "When") {
        return 2
    }
    if (!compareTokens(annotations[0].condition.toTokens(), quote(os == "Linux"))) {
        return 3
    }
    if (annotations[1].identifier.value != "C") {
        return 4
    }

    // test modifiers
    let modifiers = primaryCtor.modifiers
    if (modifiers.size != 2) {
        return 5
    }
    if (modifiers[0].keyword.value != "private" || modifiers[1].keyword.value != "const") {
        return 6
    }

    let output = quote($primaryCtor)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 7
    }

    if (myVisitor.ident.size != 0) {
        return 8
    }
    let params = primaryCtor.funcParams
    if (params.size != 2) {
        return 9
    }
    primaryCtor.dump()

    return 0
}

/* SCAN-IN
PrimaryCtorDecl {
  -annotations: 0, Annotation {
    -identifier: When
    -condition: BinaryExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "os"
          kind: IDENTIFIER
          pos: 25: 15
        }
      }
      -op: Token {
        value: "=="
        kind: EQUAL
        pos: 25: 18
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "Linux"
          kind: STRING_LITERAL
          pos: 25: 21
        }
      }
    }
  }
  -annotations: 1, Annotation {
    -identifier: C
  }
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "private"
      kind: PRIVATE
      pos: 27: 9
    }
  }
  -modifiers: 1, Modifier {
    -keyword: Token {
      value: "const"
      kind: CONST
      pos: 27: 17
    }
  }
  -identifier: Token {
    value: "Rectangle"
    kind: IDENTIFIER
    pos: 27: 23
  }
  -funcParams: 0, FuncParam {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 27: 33
    }
    -identifier: Token {
      value: "width"
      kind: IDENTIFIER
      pos: 27: 37
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 27: 42
    }
    -paramType: PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 27: 44
      }
    }
  }
  -funcParams: 1, FuncParam {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 27: 51
    }
    -identifier: Token {
      value: "height"
      kind: IDENTIFIER
      pos: 27: 55
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 27: 61
    }
    -paramType: PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 27: 63
      }
    }
  }
  -block: Block {
    -nodes: 0, AssignExpr {
      -leftExpr: MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "this"
            kind: THIS
            pos: 28: 13
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 28: 17
        }
        -field: Token {
          value: "width"
          kind: IDENTIFIER
          pos: 28: 18
        }
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 28: 24
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "10"
          kind: INTEGER_LITERAL
          pos: 28: 26
        }
      }
    }
    -nodes: 1, AssignExpr {
      -leftExpr: MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "this"
            kind: THIS
            pos: 29: 13
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 29: 17
        }
        -field: Token {
          value: "height"
          kind: IDENTIFIER
          pos: 29: 18
        }
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 29: 25
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "10"
          kind: INTEGER_LITERAL
          pos: 29: 27
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
