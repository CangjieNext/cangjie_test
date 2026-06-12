/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.MatchExpr
internal import std.collection.ArrayList

main() {
    let matchExpr = MatchExpr(quote(
        match (x) {
            case 0 => ()
            case _ => ()
        }
    ))
    matchExpr.matchCases.size |> println
    matchExpr.matchCases.clear()
    matchExpr.matchCases.size |> println
    matchExpr.dump()
}

/* SCAN
2
0
MatchExpr {
  -keyword: Token {
    value: "match"
    kind: MATCH
    pos: 17: 9
  }
  -selector: RefExpr {
    -identifier: Token {
      value: "x"
      kind: IDENTIFIER
      pos: 17: 16
    }
  }
}
*/