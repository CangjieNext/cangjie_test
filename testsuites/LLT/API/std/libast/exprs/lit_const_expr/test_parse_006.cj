// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let input = quote(
        "test \r\n\r\n"
    )
    let litConstExpr = match (parseExpr(input) as LitConstExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, litConstExpr.toTokens())
    if (!flag) {
        return 1
    }
    if (litConstExpr.literal.value != "test \\r\\n\\r\\n") {
        return 2
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
