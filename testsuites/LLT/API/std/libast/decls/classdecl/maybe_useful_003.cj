// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

var res = 0

main() {
    let input = quote(
        class X{
        }
    )
    let decl = parseDecl(input)
    decl.dump()

    return 0
}

/* SCAN-IN
ClassDecl {
  -keyword: Token {
    value: "class"
    kind: CLASS
    pos: 12: 9
  }
  -identifier: Token {
    value: "X"
    kind: IDENTIFIER
    pos: 12: 15
  }
  -body: Body {
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
