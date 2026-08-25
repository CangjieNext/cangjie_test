// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: RefExpr) {
        ident.add(curNode.identifier.value)
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        spawn (Main) {
            mtx.lock()
            count += 1
            println("CangjieFunc: spawn (Main) ${i}, tid = ${gettid()}")
            unsafe { pthread_self() }
            mtx.unlock()
        }
    )
    let re = match (parseExpr(input) as SpawnExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, re.toTokens())
    if (!flag) {
        return 1
    }
    re.dump()
    return 0
}

/* SCAN-IN
SpawnExpr {
  -keyword: Token {
    value: "spawn"
    kind: SPAWN
    pos: 21: 9
  }
  -threadContext: RefExpr {
    -identifier: Token {
      value: "Main"
      kind: IDENTIFIER
      pos: 21: 16
    }
  }
  -lambdaExpr: LambdaExpr {
    -nodes: 0, CallExpr {
      -callFunc: MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "mtx"
            kind: IDENTIFIER
            pos: 22: 13
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 22: 16
        }
        -field: Token {
          value: "lock"
          kind: IDENTIFIER
          pos: 22: 17
        }
      }
    }
    -nodes: 1, AssignExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "count"
          kind: IDENTIFIER
          pos: 23: 13
        }
      }
      -assign: Token {
        value: "+="
        kind: ADD_ASSIGN
        pos: 23: 19
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 23: 22
        }
      }
    }
    -nodes: 2, CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "println"
          kind: IDENTIFIER
          pos: 24: 13
        }
      }
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "CangjieFunc: spawn (Main) ${i}, tid = ${gettid()}"
            kind: STRING_LITERAL
            pos: 24: 21
          }
        }
      }
    }
    -nodes: 3, Block {
      -nodes: 0, CallExpr {
        -callFunc: RefExpr {
          -identifier: Token {
            value: "pthread_self"
            kind: IDENTIFIER
            pos: 25: 22
          }
        }
      }
    }
    -nodes: 4, CallExpr {
      -callFunc: MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "mtx"
            kind: IDENTIFIER
            pos: 26: 13
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 26: 16
        }
        -field: Token {
          value: "unlock"
          kind: IDENTIFIER
          pos: 26: 17
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
