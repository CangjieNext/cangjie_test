/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan FuncDecl {
// ASSERT: scan   -keyword: Token {
// ASSERT: scan     value: "func"
// ASSERT: scan     kind: FUNC
// ASSERT: scan   }
// ASSERT: scan   -identifier: Token {
// ASSERT: scan     value: "x"
// ASSERT: scan     kind: IDENTIFIER
// ASSERT: scan   }
// ASSERT: scan   -block: Block {
// ASSERT: scan     -nodes: 0, Block {
// ASSERT: scan       -nodes: 0, CallExpr {
// ASSERT: scan         -callFunc: RefExpr {
// ASSERT: scan           -identifier: Token {
// ASSERT: scan             value: "test"
// ASSERT: scan             kind: IDENTIFIER
// ASSERT: scan           }
// ASSERT: scan         }
// ASSERT: scan       }
// ASSERT: scan     }
// ASSERT: scan     -nodes: 1, TryExpr {
// ASSERT: scan       -keywordT: Token {
// ASSERT: scan         value: "try"
// ASSERT: scan         kind: TRY
// ASSERT: scan       }
// ASSERT: scan       -tryBlock: Block {
// ASSERT: scan       }
// ASSERT: scan       -keywordsC: 0, Token {
// ASSERT: scan         value: "catch"
// ASSERT: scan        kind: CATCH
// ASSERT: scan       }
// ASSERT: scan       -catchPatterns: 0, WildcardPattern {
// ASSERT: scan         -wildcard: Token {
// ASSERT: scan           value: "_"
// ASSERT: scan           kind: WILDCARD
// ASSERT: scan         }
// ASSERT: scan       }
// ASSERT: scan       -catchBlocks: 0, Block {
// ASSERT: scan       }
// ASSERT: scan       -keywordF: Token {
// ASSERT: scan         value: "finally"
// ASSERT: scan         kind: FINALLY
// ASSERT: scan       }
// ASSERT: scan       -finallyBlock: Block {
// ASSERT: scan       }
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan }
// ASSERT: scan FuncDecl
// ASSERT: scan CallExpr
// ASSERT: scan RefExpr
// ASSERT: scan TryExpr
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){
            unsafe{test()}
            try{}catch(_){}finally{}
         }
    )
    let decl = parseDecl(input)
    decl.dump()
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
