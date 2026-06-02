// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
      class C1<T1,T2,T3> <: I1 & I2 & I3 where T1 <: A, T2 <: B {}
    )

    let input2 = quote(
      class C1<T1> <: I1 & I2 & I3 where T1 <: A {}
    )

    let input3 = quote(
      class C1<T1> {}
    )

    let input4 = quote(
      class C1<T1,T2,T3> <: I1 & I2 & I3 where T1 <: Float32, T2 <: Int64, T3 <: A {}
    )

    let decl1 = parseDecl(input1)
    let decl2 = parseDecl(input2)
    let decl3 = parseDecl(input3)
    let decl4 = parseDecl(input4)
    let output1 = quote($decl1)
    let output2 = quote($decl2)
    let output3 = quote($decl3)
    let output4 = quote($decl4)
    let flag1 = compareTokens(input1, output1) // libast offers compareTokens
    let flag2 = compareTokens(input2, output2)
    let flag3 = compareTokens(input3, output3)
    let flag4 = compareTokens(input4, output4)
    if (!(flag1 && flag2 && flag3 && flag4)) {
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
