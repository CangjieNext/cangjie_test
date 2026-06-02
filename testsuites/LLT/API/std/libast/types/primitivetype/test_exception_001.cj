// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output

internal import std.ast.*

main(): Int64 {
    var cnt: Int64 = 0

    let input = quote(
        a.b
    )
    try {
        PrimitiveType(input)
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'PrimitiveType' node.") {
            cnt++;
        }
    }

    try {
        PrimitiveType(quote(Int))
    } catch (e: ASTException) {
        if (e.message == "Cannot construct the 'PrimitiveType' node.") {
            cnt++;
        }
    }

    try {
        PrimitiveType(quote())
    } catch (e: ASTException) {
        if (e.message == "parsing type error.") {
            cnt++;
        }
    }

    try {
        var p = PrimitiveType()
        p.keyword = Token(ADD)
    } catch (e: ASTException) {
        if (e.message == "Illegal TokenKind, TokenKind should be a primitive type.") {
            cnt++;
        }
    }

    try {
        PrimitiveType()
    } catch (e: ASTException) {
        println(e)
        cnt++;
    }
    print(cnt)
    if (cnt == 4) {
        return 0
    }
    return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
