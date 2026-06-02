//EXEC:%compiler %cmp_opt_chir2hlir %f -o %output
//EXEC: %run %run_opt %output
internal import std.ast.*

main(): Int64 {
    let input = quote(
        var (a, b, c) = (3, 4, 5)
    )
    let varWithTupleDecl = parseDecl(input)
    let output = quote($varWithTupleDecl)
    output.dump()
    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
