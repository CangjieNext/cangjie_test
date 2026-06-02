// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex expected a type name after ':' in function declaration, found '{'

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        interface I {
            func foo(): {
                a *() + = 12
                func func func Foo()
                class class struct let a = var = q
            }
            struct A{}[]
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
