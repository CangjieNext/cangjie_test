// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        let a: State<Int64> = State<Int64>(1,2)
    )

    let decl1 = parseDecl(input1)
    let output1 = quote($decl1)

    let flag1 = compareTokens(input1, output1) // libast offers compareTokens
    if (!flag1) {
        return 1
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
