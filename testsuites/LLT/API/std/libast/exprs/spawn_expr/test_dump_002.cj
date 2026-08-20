// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

var res = 0

main() {
    let input = quote(
        func test(){
            spawn{}
        }
        
    )
    let decl = parseDecl(input)
    decl.dump()
}

/* SCAN-IN
FuncDecl {
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 12: 9
  }
  -identifier: Token {
    value: "test"
    kind: IDENTIFIER
    pos: 12: 14
  }
  -block: Block {
    -nodes: 0, SpawnExpr {
      -keyword: Token {
        value: "spawn"
        kind: SPAWN
        pos: 13: 13
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
