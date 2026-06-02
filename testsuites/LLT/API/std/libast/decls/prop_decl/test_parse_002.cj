// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.unicode.*

main(): Int64 {
    let input2 = quote(
        struct A {
            var a: Int64 = 0
            mut prop b: Int64 {
                get() {
                    return a
                }
            }
        }
    )
    let input3 = quote(
        struct A {
            var a: Int64 = 0
            mut prop b: Int64 {
                set(value) {
                    a = value
                }
            }
        }
    )

    let decl2 = parseDecl(input2)
    let decl3 = parseDecl(input3)

    let output2 = quote($decl2)
    let output3 = quote($decl3)

    let flag2 = compareTokens(input2, output2) // libast offers compareTokens
    let flag3 = compareTokens(input3, output3) // libast offers compareTokens
    if (!flag2 || !flag3) {
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
