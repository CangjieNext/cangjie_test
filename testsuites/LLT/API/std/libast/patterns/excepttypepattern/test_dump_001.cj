// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var num = 0
    public override func visit(curNode: ExceptTypePattern) {
        num++
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        try{
            var a = 1
        } catch(e: Exception) {
            throw Exception()
        }
    )
    let te = (parseExpr(input) as TryExpr).getOrThrow()
    let flag = compareTokens(input, te.toTokens())
    if (!flag) {
        return 1
    }
    te.traverse(myVisitor)
    if (myVisitor.num != 1) {
        return 2
    }
    te.dump()
    return 0
}

/* SCAN-IN
TryExpr {
  -keywordT: Token {
    value: "try"
    kind: TRY
    pos: 21: 9
  }
  -tryBlock: Block {
    -nodes: 0, VarDecl {
      -keyword: Token {
        value: "var"
        kind: VAR
        pos: 22: 13
      }
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 22: 17
      }
      -assign: Token {
        value: "="
        kind: ASSIGN
        pos: 22: 19
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "1"
          kind: INTEGER_LITERAL
          pos: 22: 21
        }
      }
    }
  }
  -keywordsC: 0, Token {
    value: "catch"
    kind: CATCH
    pos: 23: 11
  }
  -catchPatterns: 0, ExceptTypePattern {
    -pattern: VarPattern {
      -identifier: Token {
        value: "e"
        kind: IDENTIFIER
        pos: 23: 17
      }
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 23: 18
    }
    -types: 0, RefType {
      -identifier: Token {
        value: "Exception"
        kind: IDENTIFIER
        pos: 23: 20
      }
    }
  }
  -catchBlocks: 0, Block {
    -nodes: 0, ThrowExpr {
      -keyword: Token {
        value: "throw"
        kind: THROW
        pos: 24: 13
      }
      -expr: CallExpr {
        -callFunc: RefExpr {
          -identifier: Token {
            value: "Exception"
            kind: IDENTIFIER
            pos: 24: 19
          }
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
