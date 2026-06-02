// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
internal import std.ast.*

main(): Int64 {
    let input = quote(
        Int64.foo
    )
    let memberAccess = (parseExpr(input) as MemberAccess).getOrThrow()
    let primitiveTypeExpr = (memberAccess.baseExpr as PrimitiveTypeExpr).getOrThrow()
    let primitiveToken = primitiveTypeExpr.keyword
    primitiveToken.dump()
    if (primitiveToken != Token(TokenKind.INT64, "Int64").addPosition(1, 6, 9)) {
        return -1
    }
    0
}

/* SCAN-IN
description: Int64, token_id: 65, token_literal_value: Int64, fileID: 1, line: 7, column: 9
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
