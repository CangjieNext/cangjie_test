// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan expected identifier or pattern after 'let', found keyword 'let'
// ASSERT: scan expected expression after '=', found '**'

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        class Data {
            let let a = 1
            let x = ***8 +-=-= j*2
            var x++ = y - 1
        }
    )

    let d1 = parseDecl(input1)

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
