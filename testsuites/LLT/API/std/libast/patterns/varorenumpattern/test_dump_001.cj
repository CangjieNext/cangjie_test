// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var num = 0
    public override func visit(curNode: VarOrEnumPattern) {
        num++
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        match(b) {
            case a(c) => 1
            case _ => 2
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
      value: "b"
      kind: IDENTIFIER
      pos: 21: 15
    }
  }
  -matchCases: 0, MatchCase {
    -keywordC: Token {
      value: "case"
      kind: CASE
      pos: 22: 13
    }
    -patterns: 0, EnumPattern {
      -constructor: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 22: 18
        }
      }
      -patterns: 0, VarOrEnumPattern {
        -identifier: Token {
          value: "c"
          kind: IDENTIFIER
          pos: 22: 20
        }
      }
    }
    -arrow: Token {
      value: "=>"
      kind: DOUBLE_ARROW
      pos: 22: 23
    }
    -block: Block {
      -nodes: 0, LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 22: 26
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
          value: "2"
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
