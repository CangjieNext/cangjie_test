// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main(): Int64 {
    let input = quote(
        A.B<Int64>
    )
    try {
        ThisType(input)
    } catch (e: ASTException) {
        println(e.message)
    }

    try {
        let thisType = ThisType()
        thisType.keyword = Token(OR)
        thisType.keyword.dump()
    } catch (e: ASTException) {
        println(e.message)
    }
    return 0
}

/* SCAN-IN
Cannot construct the 'ThisType' node.
description: or, token_id: 17, token_literal_value: ||, fileID: 1, line: 18, column: 28
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
