// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        class C1 {
            func f(): This {
                this
            }
        }
    )
    input.dump()
    let classDecl = match (parseDecl(input) as ClassDecl) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($classDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    let funcDecl = classDecl.body.decls[0]
    if (!flag) {
        return 1
    }
    if (!(funcDecl is FuncDecl)) {
        return 2
    }
    let ty = match (funcDecl as FuncDecl) {
        case Some(v) => v.declType
        case None => throw Exception()
    }

    if (!(ty is ThisType)) {
        return 3
    }
    let thisType = match (ty as ThisType) {
        case Some(v) => v.keyword
        case None => throw Exception()
    }
    if (thisType.value != "This") {
        return 4
    }

    let anno = classDecl.annotations
    if (anno.size != 0) {
        return 5
    }
    let k = classDecl.keyword
    if (k.value != "class") {
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
