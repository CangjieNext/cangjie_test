// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//
internal import std.ast.*

var res = 0

main() {
    let input = quote(
    func x(){
        {=> }
        {=>{=> }}
        {=> {=> }}
        a(b){}
    }
    )
    let decl = parseDecl(input)
    decl.dump()

    return 0
}

/* SCAN-IN
FuncDecl {
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 11: 5
  }
  -identifier: Token {
    value: "x"
    kind: IDENTIFIER
    pos: 11: 10
  }
  -block: Block {
    -nodes: 0, LambdaExpr {
      -doubleArrow: Token {
        value: "=>"
        kind: DOUBLE_ARROW
        pos: 12: 10
      }
    }
    -nodes: 1, LambdaExpr {
      -doubleArrow: Token {
        value: "=>"
        kind: DOUBLE_ARROW
        pos: 13: 10
      }
      -nodes: 0, LambdaExpr {
        -doubleArrow: Token {
          value: "=>"
          kind: DOUBLE_ARROW
          pos: 13: 13
        }
      }
    }
    -nodes: 2, LambdaExpr {
      -doubleArrow: Token {
        value: "=>"
        kind: DOUBLE_ARROW
        pos: 14: 10
      }
      -nodes: 0, LambdaExpr {
        -doubleArrow: Token {
          value: "=>"
          kind: DOUBLE_ARROW
          pos: 14: 14
        }
      }
    }
    -nodes: 3, TrailingClosureExpr {
      -expr: CallExpr {
        -callFunc: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 15: 9
          }
        }
        -arguments: 0, Argument {
          -expr: RefExpr {
            -identifier: Token {
              value: "b"
              kind: IDENTIFIER
              pos: 15: 11
            }
          }
        }
      }
      -lambdaExpr: LambdaExpr {
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
