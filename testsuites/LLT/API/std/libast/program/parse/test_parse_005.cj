// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    let input = quote(
        package a
        main() {
            return 0
        }
    )

    let fileNode = parseProgram(input)
    let output = quote($fileNode)
    if (!compareTokens(input, output)) {
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
