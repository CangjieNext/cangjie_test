// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
      func foo<T1,T2>(a: T1, b!: T2): Int32 where T1 <: A & A1, T2 <: B & B1 & B2 {
        return 42
      }
    )
    let input2 = quote(
      func foo<T1>(a: T1, b!: Int32): Int32 {
        return 42
      }
    )
    let decl1 = parseDecl(input1)
    let decl2 = parseDecl(input2)
    let output1 = quote($decl1)
    let output2 = quote($decl2)

    let flag1 = compareTokens(input1, output1) // libast offers compareTokens
    let flag2 = compareTokens(input2, output2) // libast offers compareTokens
    if (!(flag1 && flag2)) {
        return 1
    }

    let fd = (decl1 as FuncDecl).getOrThrow()

    let typeParams = fd.genericParam.parameters
    typeParams.dump()
    if (typeParams.size != 2) {
        return 2
    }
    if (typeParams[0].value != "T1" || typeParams[1].value != "T2") {
        return 3
    }
    let constraints = fd.genericConstraint

    if (constraints.size != 2) {
        return 4
    }
    let refIdent1 = (constraints[0].typeArgument as RefType).getOrThrow().identifier // RefType
    let upperTypes = constraints[0].upperBounds // List<Type>
    if (upperTypes.size != 2) {
        return 5
    }
    let ty1 = (upperTypes[0] as RefType).getOrThrow().identifier
    let ty2 = (upperTypes[1] as RefType).getOrThrow().identifier
    if (refIdent1.value != "T1" || ty1.value != "A" || ty2.value != "A1") {
        return 6
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
