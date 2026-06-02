// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        func foo<T>(a: Int32, b!: Int32 = 2, c!: Int32) where T <: A {
            let x = bar(2, b1: 4, c1: 2)
            let y = baz(3, f: {=>2})
            return ()
        }
    )
    let decl = parseDecl(input)
    let output = quote($decl)
    let flag = compareTokens(input, output)
    if (!flag) {
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
