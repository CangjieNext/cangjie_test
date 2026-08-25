// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        match (a) {
            case 1 => 1
            case (a,b) => 1
            case a : Int64 => 1
            case X => 1
            case X | Y => 1
            case Year(y, 0) => y * 365 * 24
            case b => 2
            case _ => 1
            case _ where (a) => 1
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
  -selector: RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 10: 16
    }
  }
  -matchCases: 0, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 11: 13
    }
    -patterns: 0, ConstPattern {
      -litConstExpr: LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 11: 18
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 11: 20
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 11: 23
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
    -patterns: 0, TuplePattern {
      -patterns: 0, VarOrEnumPattern {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 12: 19
        }
      }
      -patterns: 1, VarOrEnumPattern {
        -identifier: Token {
          value: "b"
          kind: IDENTIFIER
          pos: 12: 21
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 12: 24
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 12: 27
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
    -patterns: 0, TypePattern {
      -pattern: VarPattern {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 13: 18
        }
      }
      -colon: Token {
        value: ":"
        kind: COLON
        pos: 13: 20
      }
      -patternType: PrimitiveType {
        -keyword: Token {
          value: "Int64"
          kind: INT64
          pos: 13: 22
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 13: 28
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 13: 31
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
    -patterns: 0, VarOrEnumPattern {
      -identifier: Token {
        value: "X"
        kind: IDENTIFIER
        pos: 14: 18
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 14: 20
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 14: 23
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
    -patterns: 0, VarOrEnumPattern {
      -identifier: Token {
        value: "X"
        kind: IDENTIFIER
        pos: 15: 18
      }
    }
    -patterns: 1, VarOrEnumPattern {
      -identifier: Token {
        value: "Y"
        kind: IDENTIFIER
        pos: 15: 22
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 15: 24
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 15: 27
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
    -patterns: 0, EnumPattern {
      -constructor: RefExpr {
        -identifier: Token {
          value: "Year"
          kind: IDENTIFIER
          pos: 16: 18
        }
      }
      -patterns: 0, VarOrEnumPattern {
        -identifier: Token {
          value: "y"
          kind: IDENTIFIER
          pos: 16: 23
        }
      }
      -patterns: 1, ConstPattern {
        -litConstExpr: LitConstExpr {
          -literal: Token {
            value: "0"
            kind: INTEGER_LITERAL
            pos: 16: 26
          }
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 16: 29
    }
    -block: Block {
      -nodes: 0, BinaryExpr {
        -leftExpr: BinaryExpr {
          -leftExpr: RefExpr {
            -identifier: Token {
              value: "y"
              kind: IDENTIFIER
              pos: 16: 32
            }
          }
          -op: Token {
            value: "*"
            kind: MUL
            pos: 16: 34
          }
          -rightExpr: LitConstExpr {
            -literal: Token {
              value: "365"
              kind: INTEGER_LITERAL
              pos: 16: 36
            }
          }
        }
        -op: Token {
          value: "*"
          kind: MUL
          pos: 16: 40
        }
        -rightExpr: LitConstExpr {
          -literal: Token {
            value: "24"
            kind: INTEGER_LITERAL
            pos: 16: 42
          }
        }
      }
    }
  }
  -matchCases: 6, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 17: 13
    }
    -patterns: 0, VarOrEnumPattern {
      -identifier: Token {
        value: "b"
        kind: IDENTIFIER
        pos: 17: 18
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 17: 20
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "2"
          kind: INTEGER_LITERAL
          pos: 17: 23
        }
      }
    }
  }
  -matchCases: 7, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 18: 13
    }
    -patterns: 0, WildcardPattern {
      -wildcard: Token {
        value: "_"
        kind: WILDCARD
        pos: 18: 18
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 18: 20
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 18: 23
        }
      }
    }
  }
  -matchCases: 8, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 19: 13
    }
    -patterns: 0, WildcardPattern {
      -wildcard: Token {
        value: "_"
        kind: WILDCARD
        pos: 19: 18
      }
    }
    -keywordW: Token {
      value: "where"
      kind: WHERE
      pos: 19: 20
    }
    -patternGuard: ParenExpr {
      -expr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 19: 27
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 19: 30
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 19: 33
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
