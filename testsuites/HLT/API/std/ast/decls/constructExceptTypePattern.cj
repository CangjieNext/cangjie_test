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
// ASSERT: scan ExceptTypePattern {
// ASSERT: scan   -pattern: VarPattern {
// ASSERT: scan     -identifier: Token {
// ASSERT: scan       value: "e"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan       pos: 51: 25
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan   -colon: Token {
// ASSERT: scan     value: ":"
// ASSERT: scan     kind: COLON
// ASSERT: scan     pos: 51: 26
// ASSERT: scan   }
// ASSERT: scan   -types: 0, RefType {
// ASSERT: scan     -identifier: Token {
// ASSERT: scan       value: "Exception1"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan       pos: 51: 28
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan   -types: 1, RefType {
// ASSERT: scan     -identifier: Token {
// ASSERT: scan       value: "Exception2"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan       pos: 51: 41
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan   -types: 2, RefType {
// ASSERT: scan     -identifier: Token {
// ASSERT: scan       value: "Exception3"
// ASSERT: scan       kind: IDENTIFIER
// ASSERT: scan       pos: 51: 54
// ASSERT: scan     }
// ASSERT: scan   }
// ASSERT: scan }

import std.ast.*

main() {
    let tokens = quote( e: Exception1 | Exception2 | Exception3)
    let aa = ExceptTypePattern(tokens)
    aa.dump()
    return 0
}

