// (not Windows) EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// (not Windows) EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
import std.collection.*

main() {
    let input0 = quote(
        enum A {
            A1 | A2 | ...
        }
    )

    let enumDecl0 = EnumDecl(input0)
    println(enumDecl0.toTokens())

    let input1 = quote(
        enum A {
            | A1 | A2 | ...
        }
    )

    let enumDecl1 = EnumDecl(input1)
    println(enumDecl1.toTokens())
    return 0
}

/* SCAN-IN
enum A {
    A1
    | A2
    | ...
}

enum A {
    | A1
    | A2
    | ...
}

 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
