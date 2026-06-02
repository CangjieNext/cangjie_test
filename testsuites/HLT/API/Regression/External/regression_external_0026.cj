/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let input = quote(
        interface A{
             prop a:Int64
        }
    )
    let InterfaceDecl = parseDecl(input)
    let output = quote($InterfaceDecl)
    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }
    return 0
}
