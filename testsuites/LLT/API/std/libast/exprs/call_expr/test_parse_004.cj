// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    let in1 = quote(foo<Int32>(1, a: 2))
    let in2 = quote(foo<Int32, T>(1, 2))
    let in3 = quote(obj.m.foo<Int32, T>(1, 2))
    let in4 = quote({=>}())

    let e1 = (parseExpr(in1) as CallExpr).getOrThrow()
    let e2 = (parseExpr(in2) as CallExpr).getOrThrow()
    let e3 = (parseExpr(in3) as CallExpr).getOrThrow()
    let e4 = (parseExpr(in4) as CallExpr).getOrThrow()
    e1.toTokens().dump()
    if ((e1.callFunc as RefExpr).getOrThrow().typeArguments.size != 1) {
        return 1
    }
    var typeArgument = (e1.callFunc as RefExpr).getOrThrow().typeArguments[0]
    if ((typeArgument as PrimitiveType).getOrThrow().keyword.value != "Int32") {
        return 2
    }
    if ((e2.callFunc as RefExpr).getOrThrow().typeArguments.size != 2) {
        return 3
    }
    if (e1.arguments.size != 2) {
        return 4
    }
    if (e1.arguments[1].identifier.value != "a") {
        return 5
    }
    if ((e1.arguments[1].expr as LitConstExpr).getOrThrow().literal.value != "2") {
        return 6
    }
    if ((e3.callFunc as MemberAccess).getOrThrow().typeArguments.size != 2) {
        return 7
    }
    typeArgument = (e3.callFunc as MemberAccess).getOrThrow().typeArguments[1]
    if ((typeArgument as RefType).getOrThrow().identifier.value != "T") {
        return 8
    }

    let o1 = quote($e1)
    let o2 = quote($e2)
    let o4 = quote($e4)

    if (!compareTokens(in1, o1) || !compareTokens(in2, o2)) {
        return 8
    }

    if (!compareTokens(in4, o4)) {
        return 9
    }

    return 0
}

/* SCAN-IN
description: identifier, token_id: 137, token_literal_value: foo, fileID: 1, line: 7, column: 21
description: less, token_id: 53, token_literal_value: <, fileID: 1, line: 7, column: 24
description: Int32, token_id: 64, token_literal_value: Int32, fileID: 1, line: 7, column: 25
description: greater, token_id: 54, token_literal_value: >, fileID: 1, line: 7, column: 30
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 7, column: 31
description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 7, column: 32
description: comma, token_id: 1, token_literal_value: ,, fileID: 1, line: 7, column: 33
description: identifier, token_id: 137, token_literal_value: a, fileID: 1, line: 7, column: 35
description: colon, token_id: 28, token_literal_value: :, fileID: 1, line: 7, column: 36
description: integer_literal, token_id: 139, token_literal_value: 2, fileID: 1, line: 7, column: 38
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 7, column: 39
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
