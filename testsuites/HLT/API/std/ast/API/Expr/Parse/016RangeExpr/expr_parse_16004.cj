/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(start..=stop:step)
    let expr = parseExpr(input)
    if (expr is RangeExpr) {
        var b = match (expr as RangeExpr) {
            case Some(v) => v
            case None => throw Exception("Not RangeExpr")
        }
        var startValue = match (b.start as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var endValue = match (b.end as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var stepValue = match (b.step as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (startValue != "start" || endValue != "stop" || stepValue != "step") {
            return 1
        }
        return 0
    }
    return 5
}
