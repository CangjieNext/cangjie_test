// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    // vardecl
    var tks = quote(
    @When[!debug]
    @Frozen
    var A = 1)
    var d = parseDecl(tks)
    d.dump()

    // funcdecl
    tks = quote(
    @When[!test]
    @Frozen
    func A(){
        return 0
    })
    d = parseDecl(tks)
    d.dump()

    // funcdecl
    tks = quote(
    @!aaa["test"]
    @!aaa["11"]
    func A(){
        return 0
    })
    d = parseDecl(tks)
    d.dump()

    // extendDecl
    tks = quote(
    @!aaa["test"]
    @!aaa["11"]
    extend String {
        func foo(){}
    })
    d = parseDecl(tks)
    d.dump()

    // init
    tks = quote(
    struct R {
        let w: Int64

        @!aaa["test"]
        @!aaa["11"]
        public init(w: Int64) { 
            this.w = w
        }
    })
    d = parseDecl(tks)
    d.dump()

    tks = quote(
    struct Rectangle {
        @!aaa["test"]
        @!aaa["11"]
        public Rectangle(let width: Int64, let height: Int64) {}
    }
    )
    d = parseDecl(tks)
    d.dump()

    0
}

/* SCAN-IN
VarDecl {
  -annotations: 0, Annotation {
    -identifier: When
    -condition: UnaryExpr {
      -op: Token {
        value: "!"
        kind: NOT
        pos: 11: 11
      }
      -expr: RefExpr {
        -identifier: Token {
          value: "debug"
          kind: IDENTIFIER
          pos: 11: 12
        }
      }
    }
  }
  -annotations: 1, Annotation {
    -identifier: Frozen
  }
  -keyword: Token {
    value: "var"
    kind: VAR
    pos: 13: 5
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 13: 9
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 13: 11
  }
  -expr: LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 13: 13
    }
  }
}
FuncDecl {
  -annotations: 0, Annotation {
    -identifier: When
    -condition: UnaryExpr {
      -op: Token {
        value: "!"
        kind: NOT
        pos: 19: 11
      }
      -expr: RefExpr {
        -identifier: Token {
          value: "test"
          kind: IDENTIFIER
          pos: 19: 12
        }
      }
    }
  }
  -annotations: 1, Annotation {
    -identifier: Frozen
  }
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 21: 5
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 21: 10
  }
  -block: Block {
    -nodes: 0, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 22: 9
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "0"
          kind: INTEGER_LITERAL
          pos: 22: 16
        }
      }
    }
  }
}
FuncDecl {
  -annotations: 0, Annotation {
    -identifier: aaa
    -arguments: 0, Argument {
      -expr: LitConstExpr {
        -literal: Token {
          value: "test"
          kind: STRING_LITERAL
          pos: 29: 11
        }
      }
    }
  }
  -annotations: 1, Annotation {
    -identifier: aaa
    -arguments: 0, Argument {
      -expr: LitConstExpr {
        -literal: Token {
          value: "11"
          kind: STRING_LITERAL
          pos: 30: 11
        }
      }
    }
  }
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 31: 5
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 31: 10
  }
  -block: Block {
    -nodes: 0, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 32: 9
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "0"
          kind: INTEGER_LITERAL
          pos: 32: 16
        }
      }
    }
  }
}
ExtendDecl {
  -annotations: 0, Annotation {
    -identifier: aaa
    -arguments: 0, Argument {
      -expr: LitConstExpr {
        -literal: Token {
          value: "test"
          kind: STRING_LITERAL
          pos: 39: 11
        }
      }
    }
  }
  -annotations: 1, Annotation {
    -identifier: aaa
    -arguments: 0, Argument {
      -expr: LitConstExpr {
        -literal: Token {
          value: "11"
          kind: STRING_LITERAL
          pos: 40: 11
        }
      }
    }
  }
  -keyword: Token {
    value: "extend"
    kind: EXTEND
    pos: 41: 5
  }
  -extendType: RefType {
    -identifier: Token {
      value: "String"
      kind: IDENTIFIER
      pos: 41: 12
    }
  }
  -body: Body {
    -decls: 0, FuncDecl {
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 42: 9
      }
      -identifier: Token {
        value: "foo"
        kind: IDENTIFIER
        pos: 42: 14
      }
      -block: Block {
      }
    }
  }
}
StructDecl {
  -keyword: Token {
    value: "struct"
    kind: STRUCT
    pos: 49: 5
  }
  -identifier: Token {
    value: "R"
    kind: IDENTIFIER
    pos: 49: 12
  }
  -body: Body {
    -decls: 0, VarDecl {
      -keyword: Token {
        value: "let"
        kind: LET
        pos: 50: 9
      }
      -identifier: Token {
        value: "w"
        kind: IDENTIFIER
        pos: 50: 13
      }
      -declType: PrimitiveType {
        -keyword: Token {
          value: "Int64"
          kind: INT64
          pos: 50: 16
        }
      }
    }
    -decls: 1, FuncDecl {
      -annotations: 0, Annotation {
        -identifier: aaa
        -arguments: 0, Argument {
          -expr: LitConstExpr {
            -literal: Token {
              value: "test"
              kind: STRING_LITERAL
              pos: 52: 15
            }
          }
        }
      }
      -annotations: 1, Annotation {
        -identifier: aaa
        -arguments: 0, Argument {
          -expr: LitConstExpr {
            -literal: Token {
              value: "11"
              kind: STRING_LITERAL
              pos: 53: 15
            }
          }
        }
      }
      -modifiers: 0, Modifier {
        -keyword: Token {
          value: "public"
          kind: PUBLIC
          pos: 54: 9
        }
      }
      -keyword: Token {
        value: "init"
        kind: INIT
        pos: 54: 16
      }
      -identifier: Token {
        value: "init"
        kind: IDENTIFIER
        pos: 54: 16
      }
      -funcParams: 0, FuncParam {
        -identifier: Token {
          value: "w"
          kind: IDENTIFIER
          pos: 54: 21
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 54: 22
        }
        -paramType: PrimitiveType {
          -keyword: Token {
            value: "Int64"
            kind: INT64
            pos: 54: 24
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
                pos: 55: 13
              }
            }
            -dot: Token {
              value: "."
              kind: DOT
              pos: 55: 17
            }
            -field: Token {
              value: "w"
              kind: IDENTIFIER
              pos: 55: 18
            }
          }
          -assign: Token {
            value: "="
            kind: ASSIGN
            pos: 55: 20
          }
          -rightExpr: RefExpr {
            -identifier: Token {
              value: "w"
              kind: IDENTIFIER
              pos: 55: 22
            }
          }
        }
      }
    }
  }
}
StructDecl {
  -keyword: Token {
    value: "struct"
    kind: STRUCT
    pos: 62: 5
  }
  -identifier: Token {
    value: "Rectangle"
    kind: IDENTIFIER
    pos: 62: 12
  }
  -body: Body {
    -decls: 0, PrimaryCtorDecl {
      -annotations: 0, Annotation {
        -identifier: aaa
        -arguments: 0, Argument {
          -expr: LitConstExpr {
            -literal: Token {
              value: "test"
              kind: STRING_LITERAL
              pos: 63: 15
            }
          }
        }
      }
      -annotations: 1, Annotation {
        -identifier: aaa
        -arguments: 0, Argument {
          -expr: LitConstExpr {
            -literal: Token {
              value: "11"
              kind: STRING_LITERAL
              pos: 64: 15
            }
          }
        }
      }
      -modifiers: 0, Modifier {
        -keyword: Token {
          value: "public"
          kind: PUBLIC
          pos: 65: 9
        }
      }
      -identifier: Token {
        value: "Rectangle"
        kind: IDENTIFIER
        pos: 65: 16
      }
      -funcParams: 0, FuncParam {
        -keyword: Token {
          value: "let"
          kind: LET
          pos: 65: 26
        }
        -identifier: Token {
          value: "width"
          kind: IDENTIFIER
          pos: 65: 30
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 65: 35
        }
        -paramType: PrimitiveType {
          -keyword: Token {
            value: "Int64"
            kind: INT64
            pos: 65: 37
          }
        }
      }
      -funcParams: 1, FuncParam {
        -keyword: Token {
          value: "let"
          kind: LET
          pos: 65: 44
        }
        -identifier: Token {
          value: "height"
          kind: IDENTIFIER
          pos: 65: 48
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 65: 54
        }
        -paramType: PrimitiveType {
          -keyword: Token {
            value: "Int64"
            kind: INT64
            pos: 65: 56
          }
        }
      }
      -block: Block {
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
