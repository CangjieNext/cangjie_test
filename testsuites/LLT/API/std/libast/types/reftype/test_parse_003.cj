// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        let a: Array<Int64> = a1
    )
    let input2 = quote(
        let a: Array<Array<Int64>> = a2
    )

    let decl1 = (parseDecl(input1) as VarDecl).getOrThrow()
    let decl2 = (parseDecl(input2) as VarDecl).getOrThrow()

    let t1 = decl1.declType
    let t2 = decl2.declType
    if (!(t1 is RefType) || !(t2 is RefType)) {
        return 1
    }

    if (!((t1 as RefType).getOrThrow().typeArguments[0] is PrimitiveType)) {
        return 2
    }

    let output1 = quote($decl1)
    let output2 = quote($decl2)

    let flag1 = compareTokens(input1, output1) // libast offers compareTokens
    if (!flag1) {
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
