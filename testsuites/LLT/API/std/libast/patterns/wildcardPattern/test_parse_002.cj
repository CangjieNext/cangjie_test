// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let pattern = WildcardPattern()
    pattern.wildcard = Token(TokenKind.WILDCARD)
    pattern.dump()

    return 0
}

/* SCAN-IN
WildcardPattern {
  -wildcard: Token {
    value: "_"
    kind: WILDCARD
    pos: 8: 24
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
