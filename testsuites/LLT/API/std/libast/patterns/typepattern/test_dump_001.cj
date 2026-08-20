// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var num = 0
    public override func visit(curNode: TypePattern) {
        num++
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        match (d) {
            case b: Base => b.a
            case _ => 0
        }
    )
    let me = (parseExpr(input) as MatchExpr).getOrThrow()
    let flag = compareTokens(input, me.toTokens())
    if (!flag) {
        return 1
    }
    me.traverse(myVisitor)
    if (myVisitor.num != 1) {
        return 2
    }
    me.dump()
    return 0
}

/* SCAN-IN
MatchExpr {
  -keyword: Token {
    value: "match"
    kind: MATCH
    pos: 21: 9
  }
  -selector: RefExpr {
    -identifier: Token {
      value: "d"
      kind: IDENTIFIER
      pos: 21: 16
    }
  }
  -matchCases: 0, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 22: 13
    }
    -patterns: 0, TypePattern {
      -pattern: VarPattern {
        -identifier: Token {
          value: "b"
          kind: IDENTIFIER
          pos: 22: 18
        }
      }
      -colon: Token {
        value: ":"
        kind: COLON
        pos: 22: 19
      }
      -patternType: RefType {
        -identifier: Token {
          value: "Base"
          kind: IDENTIFIER
          pos: 22: 21
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 22: 26
    }
    -block: Block {
      -nodes: 0, MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "b"
            kind: IDENTIFIER
            pos: 22: 29
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 22: 30
        }
        -field: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 22: 31
        }
      }
    }
  }
  -matchCases: 1, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 23: 13
    }
    -patterns: 0, WildcardPattern {
      -wildcard: Token {
        value: "_"
        kind: WILDCARD
        pos: 23: 18
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 23: 20
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "0"
          kind: INTEGER_LITERAL
          pos: 23: 23
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
