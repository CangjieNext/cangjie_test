// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        var a: ??Int64
    )
    let varDecl = (parseDecl(input) as VarDecl).getOrThrow()
    let output = quote($varDecl)
    let flag = compareTokens(input, output)
    if (flag) {
        return 1
    }
    let ty = varDecl.declType
    if (!(ty is PrefixType)) {
        return 2
    }
    let optionType = (ty as PrefixType).getOrThrow()

    if (!(optionType.baseType is PrimitiveType)) {
        return 3
    }
    if (optionType.prefixOps.size != 2) {
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
