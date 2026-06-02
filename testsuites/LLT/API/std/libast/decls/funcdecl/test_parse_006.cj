// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
		class A {
        	let x = 42
        	operator func [](a: Int32, b: Int32): Int32 {
                return a + b
            }
        	operator func ()(a: Int32, b: Int32): Int32 {
                return a + b
            }
        	operator func >>(a: Int32, b: Int32): Int32 {
                return a + b
            }
        	operator func >=(a: Int32, b: Int32): Int32 {
                return a + b
            }
        }
    )

    let decl = parseDecl(input)
    let output = quote($decl)
    if (!compareTokens(input, output)) {
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
