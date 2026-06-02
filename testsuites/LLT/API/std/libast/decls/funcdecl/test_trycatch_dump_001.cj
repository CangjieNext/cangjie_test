// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){
            unsafe{ test() }
            try { 
            } catch(e: ASTException) {
            } catch(_) {
            } finally{
            }
         }
    )
    let decl = parseDecl(input)
    decl.dump()
    return 0
}

/* SCAN-IN
FuncDecl {
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 10: 10
  }
  -identifier: Token {
    value: "x"
    kind: IDENTIFIER
    pos: 10: 15
  }
  -block: Block {
    -nodes: 0, Block {
      -nodes: 0, CallExpr {
        -callFunc: RefExpr {
          -identifier: Token {
            value: "test"
            kind: IDENTIFIER
            pos: 11: 21
          }
        }
      }
    }
    -nodes: 1, TryExpr {
      -keywordT: Token {
        value: "try"
        kind: TRY
        pos: 12: 13
      }
      -tryBlock: Block {
      }
      -keywordsC: 0, Token {
        value: "catch"
        kind: CATCH
        pos: 13: 15
      }
      -catchPatterns: 0, ExceptTypePattern {
        -pattern: VarPattern {
          -identifier: Token {
            value: "e"
            kind: IDENTIFIER
            pos: 13: 21
          }
        }
        -colon: Token {
          value: ":"
          kind: COLON
          pos: 13: 22
        }
        -types: 0, RefType {
          -identifier: Token {
            value: "ASTException"
            kind: IDENTIFIER
            pos: 13: 24
          }
        }
      }
      -catchBlocks: 0, Block {
      }
      -keywordsC: 1, Token {
        value: "catch"
        kind: CATCH
        pos: 14: 15
      }
      -catchPatterns: 1, WildcardPattern {
        -wildcard: Token {
          value: "_"
          kind: WILDCARD
          pos: 14: 21
        }
      }
      -catchBlocks: 1, Block {
      }
      -keywordF: Token {
        value: "finally"
        kind: FINALLY
        pos: 15: 15
      }
      -finallyBlock: Block {
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
