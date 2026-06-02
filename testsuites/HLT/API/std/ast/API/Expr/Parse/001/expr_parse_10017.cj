/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote('\u{50}')
    let expr = parseExpr(input)
    if (expr is LitConstExpr) {
        var res = match (expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception()
        }
        if (res == "\\u{50}") {
            return 0
        }
    }
    return 1
}
