// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        let f1: CFunc<() -> Unit>  = ()
    )
    let fd = parseDecl(input) as VarDecl
    var funcDecl = match (fd) {
        case Some(v) => v
        case None => throw Exception()
    }
    let output = quote($funcDecl)
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
