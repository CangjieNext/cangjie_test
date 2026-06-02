// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = quote(HashMap<Int, String>())
    let (e, c) = parseExprFragment(code, startFrom: 0)

    if (c != 8 || c != code.size) {
        println("c = ${c}")
        return -1
    }

    if (e.toTokens().toString() != "HashMap < Int, String >()") {
        println("e.toTokens().toString() = ${e.toTokens().toString()}")
        return -1
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
