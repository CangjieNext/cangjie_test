/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT:scan Not BinaryExpr

import std.ast.*

main() {
    var input: Tokens = quote(1)
    let expr = parseExpr(input)
    var res = match (expr as BinaryExpr) {
        case Some(v) => v
        case None => throw Exception("Not BinaryExpr")
    }
    return 0
}
