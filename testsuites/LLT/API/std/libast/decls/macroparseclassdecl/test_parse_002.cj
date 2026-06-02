// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    var input = quote(public macro X (input:Tokens) : Tokens { return input })
    let decl = (parseDecl(input) as MacroDecl).getOrThrow()
    var output = quote($decl)
    input.dump()
    println("\n\n")
    output.dump()
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
