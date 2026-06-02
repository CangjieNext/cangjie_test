// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
       for(i in 0..10 where i>1) {
        a+=i
       }
    )
    let input2 = quote(
       for(i in 0..10) {
        a+=i
       }
    )

    let forinExpr1 = parseExpr(input1)
    let output1 = quote($forinExpr1)
    let forinExpr2 = (parseExpr(input2) as ForInExpr).getOrThrow()
    let output2 = quote($forinExpr2)
    let flag1 = compareTokens(input1, output1)
    let flag2 = compareTokens(input2, output2)
    if (!flag1 || !flag2) {
        return 1
    }

    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
