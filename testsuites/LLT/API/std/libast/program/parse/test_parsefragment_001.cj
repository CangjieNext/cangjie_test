// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main(): Int64 {
    let tokens = quote(1;1+1;;

    ;2-2-3+2)
    let (a, b) = parseExprFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parseExprFragment(tokens, startFrom: b)
    c.dump()
    println(d)
    let (e, f) = parseExprFragment(tokens, startFrom: d)
    e.dump()
    println(f)
    return 0;
}

/* SCAN-IN
LitConstExpr {
  -literal: Token {
    value: "1"
    kind: INTEGER_LITERAL
    pos: 7: 24
  }
}
2
BinaryExpr {
  -leftExpr: LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 7: 26
    }
  }
  -op: Token {
    value: "+"
    kind: ADD
    pos: 7: 27
  }
  -rightExpr: LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 7: 28
    }
  }
}
10
BinaryExpr {
  -leftExpr: BinaryExpr {
    -leftExpr: BinaryExpr {
      -leftExpr: LitConstExpr {
        -literal: Token {
          value: "2"
          kind: INTEGER_LITERAL
          pos: 9: 6
        }
      }
      -op: Token {
        value: "-"
        kind: SUB
        pos: 9: 7
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "2"
          kind: INTEGER_LITERAL
          pos: 9: 8
        }
      }
    }
    -op: Token {
      value: "-"
      kind: SUB
      pos: 9: 9
    }
    -rightExpr: LitConstExpr {
      -literal: Token {
        value: "3"
        kind: INTEGER_LITERAL
        pos: 9: 10
      }
    }
  }
  -op: Token {
    value: "+"
    kind: ADD
    pos: 9: 11
  }
  -rightExpr: LitConstExpr {
    -literal: Token {
      value: "2"
      kind: INTEGER_LITERAL
      pos: 9: 12
    }
  }
}
17
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
