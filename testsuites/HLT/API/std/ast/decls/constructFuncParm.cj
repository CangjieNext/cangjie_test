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
// ASSERT: scan FuncParam {
// ASSERT: scan   -identifier: Token {
// ASSERT: scan     value: "a"
// ASSERT: scan     kind: IDENTIFIER
// ASSERT: scan     pos: 36: 9
// ASSERT: scan   }
// ASSERT: scan   -colon: Token {
// ASSERT: scan     value: ":"
// ASSERT: scan     kind: COLON
// ASSERT: scan     pos: 36: 10
// ASSERT: scan   }
// ASSERT: scan   -paramType: PrimitiveType {
// ASSERT: scan     -keyword: Token {
// ASSERT: scan       value: "Int64"
// ASSERT: scan       kind: INT64
// ASSERT: scan       pos: 36: 12
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan }

import std.ast.*

main() {
    let tokens = quote(
        a: Int64
    )
    let aa = FuncParam(tokens)
    aa.dump()
    return 0
}
