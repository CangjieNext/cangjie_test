// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        match {
            case 0 => let a = 1
            case 1 < 0 => print("fail")
            case a | b => ()
            case (1,2) => ()
            case Year(12,a) => (())
            case _ => c
        }
    )

    let expr = match (parseExpr(input) as MatchExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.dump()

    return 0
}

/* SCAN-IN
MatchExpr {
  -keyword: Token {
    value: "match"
    kind: MATCH
    pos: 10: 9
  }
  -matchCases: 0, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 11: 13
    }
    -expr:LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
        pos: 11: 18
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 11: 20
    }
    -block: Block {
      -nodes: 0, VarDecl {
        -keyword: Token {
          value: "let"
          kind: LET
          pos: 11: 23
        }
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 11: 27
        }
        -assign: Token {
          value: "="
          kind: ASSIGN
          pos: 11: 29
        }
        -expr: LitConstExpr {
          -literal: Token {
            value: "1"
            kind: INTEGER_LITERAL
            pos: 11: 31
          }
        }
      }
    }
  }
  -matchCases: 1, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 12: 13
    }
    -expr:BinaryExpr {
      -leftExpr: LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 12: 18
        }
      }
      -op: Token {
        value: "<"
        kind: LT
        pos: 12: 20
      }
      -rightExpr: LitConstExpr {
        -literal: Token {
          value: "0"
          kind: INTEGER_LITERAL
          pos: 12: 22
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 12: 24
    }
    -block: Block {
      -nodes: 0, CallExpr {
        -callFunc: RefExpr {
          -identifier: Token {
            value: "print"
            kind: IDENTIFIER
            pos: 12: 27
          }
        }
        -arguments: 0, Argument {
          -expr: LitConstExpr {
            -literal: Token {
              value: "fail"
              kind: STRING_LITERAL
              pos: 12: 33
            }
          }
        }
      }
    }
  }
  -matchCases: 2, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 13: 13
    }
    -expr:BinaryExpr {
      -leftExpr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 13: 18
        }
      }
      -op: Token {
        value: "|"
        kind: BITOR
        pos: 13: 20
      }
      -rightExpr: RefExpr {
        -identifier: Token {
          value: "b"
          kind: IDENTIFIER
          pos: 13: 22
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 13: 24
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "()"
          kind: UNIT_LITERAL
          pos: 13: 27
        }
      }
    }
  }
  -matchCases: 3, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 14: 13
    }
    -expr:TupleLiteral {
      -elements: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 14: 19
        }
      }
      -elements: 1, LitConstExpr {
        -literal: Token {
          value: "2"
          kind: INTEGER_LITERAL
          pos: 14: 21
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 14: 24
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "()"
          kind: UNIT_LITERAL
          pos: 14: 27
        }
      }
    }
  }
  -matchCases: 4, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 15: 13
    }
    -expr:CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "Year"
          kind: IDENTIFIER
          pos: 15: 18
        }
      }
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "12"
            kind: INTEGER_LITERAL
            pos: 15: 23
          }
        }
      }
      -arguments: 1, Argument {
        -expr: RefExpr {
          -identifier: Token {
            value: "a"
            kind: IDENTIFIER
            pos: 15: 26
          }
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 15: 29
    }
    -block: Block {
      -nodes: 0, ParenExpr {
        -expr: LitConstExpr {
          -literal: Token {
            value: "()"
            kind: UNIT_LITERAL
            pos: 15: 33
          }
        }
      }
    }
  }
  -matchCases: 5, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 16: 13
    }
    -expr:WildcardExpr {
      -keyword: Token {
        value: "_"
        kind: WILDCARD
        pos: 16: 18
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 16: 20
    }
    -block: Block {
      -nodes: 0, RefExpr {
        -identifier: Token {
          value: "c"
          kind: IDENTIFIER
          pos: 16: 23
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
