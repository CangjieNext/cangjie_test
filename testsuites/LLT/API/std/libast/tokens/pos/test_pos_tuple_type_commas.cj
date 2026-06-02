// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(let x: (Int16, Int16 , String   , Int32))

    let ty = (parseDecl(input) as VarDecl).getOrThrow().declType
    let output = ty.toTokens()

    if (output.size != 9) {
        return 1
    }
    let comma1 = output[2]
    if (comma1.kind != TokenKind.COMMA || comma1.pos.column != 36) {
        return 2
    }
    let comma2 = output[4]
    if (comma2.kind != TokenKind.COMMA || comma2.pos.column != 44) {
        return 3
    }
    let comma3 = output[6]
    if (comma3.kind != TokenKind.COMMA || comma3.pos.column != 55) {
        return 4
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
