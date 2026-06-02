// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    let input = quote(package a.  b  . c)

    let pkgHeader = parseProgram(input).packageHeader
    let output = pkgHeader.prefixPaths.toTokens()
    if (output.size != 2) {
        return 1
    }
    let dot1 = output[0]
    if (dot1.kind != TokenKind.IDENTIFIER || dot1.pos.column != 31) {
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
