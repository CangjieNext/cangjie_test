/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

import std.ast.*

main(): Int64 {
    var input = 1
    let expr = parseExpr(input)
    if (expr is VJPExpr) {
        var b = match (expr as VJPExpr) {
            case Some(v) => v
            case None => throw Exception("Not VJPExpr")
        }
        return 0
    }
    return 1
}
// ASSERT: scan sema_mismatched_types
