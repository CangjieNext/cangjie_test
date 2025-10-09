/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan PrimaryCtorDecl {
// ASSERT: scan   -modifiers: 0, Modifier {
// ASSERT: scan     -keyword: Token {
// ASSERT: scan       value: "public"
// ASSERT: scan       kind: PUBLIC
// ASSERT: scan       pos: 80: 9
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan   -identifier: Token {
// ASSERT: scan     value: "Rectangle"
// ASSERT: scan     kind: IDENTIFIER
// ASSERT: scan     pos: 80: 16
// ASSERT: scan   }
// ASSERT: scan   -funcParams: 0, FuncParam {
// ASSERT: scan     -keyword: Token {
// ASSERT: scan       value: "let"
// ASSERT: scan       kind: LET
// ASSERT: scan       pos: 80: 26
// ASSERT: scan     }
// ASSERT: scan     -identifier: Token {
// ASSERT: scan       value: "width"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan       pos: 80: 30
// ASSERT: scan     }
// ASSERT: scan     -colon: Token {
// ASSERT: scan       value: ":"
// ASSERT: scan       kind: COLON
// ASSERT: scan       pos: 80: 35
// ASSERT: scan     }
// ASSERT: scan     -paramType: PrimitiveType {
// ASSERT: scan       -keyword: Token {
// ASSERT: scan         value: "Int64"
// ASSERT: scan         kind: INT64
// ASSERT: scan         pos: 80: 37
// ASSERT: scan       }
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan   -funcParams: 1, FuncParam {
// ASSERT: scan     -keyword: Token {
// ASSERT: scan       value: "let"
// ASSERT: scan       kind: LET
// ASSERT: scan       pos: 80: 44
// ASSERT: scan     }
// ASSERT: scan     -identifier: Token {
// ASSERT: scan       value: "height"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan       pos: 80: 48
// ASSERT: scan     }
// ASSERT: scan     -colon: Token {
// ASSERT: scan       value: ":"
// ASSERT: scan       kind: COLON
// ASSERT: scan       pos: 80: 54
// ASSERT: scan     }
// ASSERT: scan     -paramType: PrimitiveType {
// ASSERT: scan       -keyword: Token {
// ASSERT: scan         value: "Int64"
// ASSERT: scan         kind: INT64
// ASSERT: scan         pos: 80: 56
// ASSERT: scan       }
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan   -block: Block {
// ASSERT: scan   }
// ASSERT: scan }
import std.ast.*

main() {
    let tokens = quote(
        public Rectangle(let width: Int64, let height: Int64) {}
    )
    let aa = PrimaryCtorDecl(tokens)
    aa.dump()
    return 0
}

