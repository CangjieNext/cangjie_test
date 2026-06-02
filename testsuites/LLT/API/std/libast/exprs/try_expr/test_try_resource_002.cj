/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.{TryExpr, Visitor}

class MyVisitor <: Visitor {
    public override func visit(_: TryExpr) {
        println("Inside TryExpr")
    }
}

main() {
    let tryExpr = TryExpr(quote(
        try (x = A(), y = B()) {
            println(x)
            println(y)
        }
    ))
    tryExpr.toTokens() |> println
    tryExpr.dump()
    tryExpr.traverse(MyVisitor())
}

/* SCAN
try(x = A()
, y = B()
) {
    println(x)
    println(y)
}
TryExpr {
  -keywordT: Token {
    value: "try"
    kind: TRY
    pos: 22: 9
  }
  -resourceSpec: 0, VarDecl {
    -identifier: Token {
      value: "x"
      kind: IDENTIFIER
      pos: 22: 14
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 22: 16
    }
    -expr: CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "A"
          kind: IDENTIFIER
          pos: 22: 18
        }
      }
    }
  }
  -resourceSpec: 1, VarDecl {
    -identifier: Token {
      value: "y"
      kind: IDENTIFIER
      pos: 22: 23
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 22: 25
    }
    -expr: CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "B"
          kind: IDENTIFIER
          pos: 22: 27
        }
      }
    }
  }
  -tryBlock: Block {
    -nodes: 0, CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "println"
          kind: IDENTIFIER
          pos: 23: 13
        }
      }
      -arguments: 0, Argument {
        -expr: RefExpr {
          -identifier: Token {
            value: "x"
            kind: IDENTIFIER
            pos: 23: 21
          }
        }
      }
    }
    -nodes: 1, CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "println"
          kind: IDENTIFIER
          pos: 24: 13
        }
      }
      -arguments: 0, Argument {
        -expr: RefExpr {
          -identifier: Token {
            value: "y"
            kind: IDENTIFIER
            pos: 24: 21
          }
        }
      }
    }
  }
}
Inside TryExpr
*/