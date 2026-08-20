// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

class MyVisitor <: Visitor {}

main() {
    let input = quote(
        main(){
            (a~>b)("hello")
        }
    )
    let node = parseDecl(input)
    node.traverse(MyVisitor())

    let decl = match (node as MainDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    if (decl.block.nodes.size != 1) {
        return 1
    }
    let callExpr = (decl.block.nodes[0] as CallExpr).getOrThrow()
    callExpr.dump()
    0
}

/* SCAN-IN
CallExpr {
  -callFunc: ParenExpr {
    -expr: BinaryExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 13: 14
        }
      }
      -op: Token {
        value: "~>"
        kind: COMPOSITION
        pos: 13: 15
      }
      -rightExpr: RefExpr {
        -identifier: Token {
          value: "b"
          kind: IDENTIFIER
          pos: 13: 17
        }
      }
    }
  }
  -arguments: 0, Argument {
    -expr: LitConstExpr {
      -literal: Token {
        value: "hello"
        kind: STRING_LITERAL
        pos: 13: 20
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
