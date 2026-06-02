// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(let x: ?   ??String)

    let ty = (parseDecl(input) as VarDecl).getOrThrow().declType
    let output = ty.toTokens()
    output.dump()
    if (output.size != 4) {
        return 1
    }
    let quest1 = output[0]
    if (quest1.kind != TokenKind.QUEST || quest1.pos.column != 30) {
        return 2
    }
    let quest2 = output[1]
    if (quest2.kind != TokenKind.QUEST || quest2.pos.column != 34) {
        return 3
    }
    let quest3 = output[2]
    if (quest3.kind != TokenKind.QUEST || quest3.pos.column != 35) {
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
