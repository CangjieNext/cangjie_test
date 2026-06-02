/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    var tokens = quote(
        struct Foo{
    )

    for (i in 0..8) {
        tokens = tokens + quote(let $(Token(IDENTIFIER,"BIT_${i}")) = 1 << $(i))
    }
    tokens += quote(
        }
    )
    println("${tokens}")
}

// (Windows) ASSERT: scan  let BIT_0 = 1 << 0 let BIT_1 = 1 << 1 let BIT_2 = 1 << 2 let BIT_3 = 1 << 3 let BIT_4 = 1 << 4 let BIT_5 = 1 << 5 let BIT_6 = 1 << 6 let BIT_7 = 1 << 7
// (not Windows) ASSERT: scan \nstruct Foo {\n    let BIT_0 = 1 << 0 let BIT_1 = 1 << 1 let BIT_2 = 1 << 2 let BIT_3 = 1 << 3 let BIT_4 = 1 << 4 let BIT_5 = 1 << 5 let BIT_6 = 1 << 6 let BIT_7 = 1 << 7\n}\n
