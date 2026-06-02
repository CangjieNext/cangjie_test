/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan cannot decrement a un-assignable expression

import std.ast.*

main(): Int64 {
    var input: Tokens = quote(a++--)
    let expr = parseExpr(input)
    if (expr is IncOrDecExpr) {
        return 1
    }
    return 0
}
