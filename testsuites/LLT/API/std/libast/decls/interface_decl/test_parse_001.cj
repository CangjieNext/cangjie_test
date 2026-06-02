// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        interface Foo<T1,T2> <: I1 & I2 where T1 <: A & B, T2 <: C & D {
            func f1(): Int32 {
                return 42
            }
            func f2(): Int32 {
                return 42
            }
        }
    )
    let parseInterfaceDecl: InterfaceDecl = (parseDecl(input) as InterfaceDecl).getOrThrow()
    let kw = parseInterfaceDecl.keyword
    if (kw.value != "interface") {
        return 1
    }
    let id = parseInterfaceDecl.identifier
    if (id.value != "Foo") {
        return 2
    }
    if (parseInterfaceDecl.body.decls.size != 2) {
        return 3
    }

    let output = quote($parseInterfaceDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
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
