// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let input = quote(
        (x: Int64, y: (Int32, Float64))
    )
    let ty = TupleType(input)
    let flag = compareTokens(input, ty.toTokens())
    if (!flag) {
        return 1
    }
    ty.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
