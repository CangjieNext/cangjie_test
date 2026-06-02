// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        interface Foo<T1> <: I1 where T1 <: A {
            func f2(): Int32 {
                return 42
            }
        }
    )
    let decl = parseDecl(input)
    if (!(decl is InterfaceDecl)) {
        return 1
    }
    let itfDecl: InterfaceDecl = (decl as InterfaceDecl).getOrThrow()

    // Test API for InterfaceDecl.
    let kw = itfDecl.keyword
    if (kw.value != "interface") {
        return 2
    }
    let id = itfDecl.identifier
    if (id.value != "Foo") {
        return 3
    }
    let anno = itfDecl.annotations
    if (anno.size != 0) {
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
