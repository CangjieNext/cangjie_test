// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        struct A <: T1 & T2 & T3 {
            var count =  0
            var res = ""
            init(res: String, count: int64) {
                this.res = res
                this.count = count
            }
       }
    )
    let decl = parseDecl(input)
    if (!(decl is StructDecl)) {
        return 1
    }

    let structDecl = match (decl as StructDecl) {
        case Some(v) => v
        case None => throw Exception()
    }

    let anno = structDecl.annotations
    if (anno.size != 0) {
        return 2
    }
    let output = quote($structDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 3
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
