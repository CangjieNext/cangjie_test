// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

main(): Int64 {
    let input = quote(
        ("I" == "am") is Bool
    )

    let isExpr = match (parseExpr(input) as IsExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let expr = isExpr.expr
    let ty = isExpr.shiftType
    if (!(expr is ParenExpr)) {
        return 1
    }
    if (!(ty is PrimitiveType)) {
        return 2
    }
    isExpr.dump()
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
