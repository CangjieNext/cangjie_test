// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    // vardecl
    let tks = quote(
    @!custom[test]
    @Frozen
    var A = 1)
    let vd = VarDecl(tks)
    let annos = vd.annotations
    if (annos[0].identifier.value != "custom" || annos[1].identifier.value != "Frozen") {
        return 2
    }
    if (annos[0].at.kind != TokenKind.AT_EXCL || annos[1].at.kind != TokenKind.AT) {
        return 3
    }

    vd.dump()

    0
}

/* SCAN-IN
VarDecl {
  -annotations: 0, Annotation {
    -identifier: custom
    -arguments: 0, Argument {
      -expr: RefExpr {
        -identifier: Token {
          value: "test"
          kind: IDENTIFIER
          pos: 11: 14
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
 */

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
