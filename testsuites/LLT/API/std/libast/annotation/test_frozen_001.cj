// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

class TestClass {
    @Frozen
    public prop a: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func getA() {
        return 1
    }
}

main() {
    let t = TestClass()
    println(t.a)
    println(t.getA())

    let tokens = quote(class TestClass {
    @Frozen
    public prop a: Int64 {
        get() { 1 }
    }

    @Frozen
    public func getA() {
        return 1
    }
})
    let decl = ClassDecl(tokens)
    decl.dump()
    return 0
}

/* SCAN-IN
1
1
ClassDecl {
  -keyword: Token {
    value: "class"
    kind: CLASS
    pos: 25: 24
  }
  -identifier: Token {
    value: "TestClass"
    kind: IDENTIFIER
    pos: 25: 30
  }
  -body: Body {
    -decls: 0, PropDecl {
      -annotations: 0, Annotation {
        -identifier: Frozen
      }
      -modifiers: 0, Modifier {
        -keyword: Token {
          value: "public"
          kind: PUBLIC
          pos: 27: 5
        }
      }
      -keyword: Token {
        value: "prop"
        kind: PROP
        pos: 27: 12
      }
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 27: 17
      }
      -declType: PrimitiveType {
        -keyword: Token {
          value: "Int64"
          kind: INT64
          pos: 27: 20
        }
      }
      -getter: FuncDecl {
        -identifier: Token {
          value: "get"
          kind: IDENTIFIER
          pos: 28: 9
        }
        -block: Block {
          -nodes: 0, LitConstExpr {
            -literal: Token {
              value: "1"
              kind: INTEGER_LITERAL
              pos: 28: 17
            }
          }
        }
      }
    }
    -decls: 1, FuncDecl {
      -annotations: 0, Annotation {
        -identifier: Frozen
      }
      -modifiers: 0, Modifier {
        -keyword: Token {
          value: "public"
          kind: PUBLIC
          pos: 32: 5
        }
      }
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 32: 12
      }
      -identifier: Token {
        value: "getA"
        kind: IDENTIFIER
        pos: 32: 17
      }
      -block: Block {
        -nodes: 0, ReturnExpr {
          -keyword: Token {
            value: "return"
            kind: RETURN
            pos: 33: 9
          }
          -expr: LitConstExpr {
            -literal: Token {
              value: "1"
              kind: INTEGER_LITERAL
              pos: 33: 16
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
