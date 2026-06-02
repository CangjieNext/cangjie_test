// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.unicode.*

main(): Int64 {
    let input1 = quote(
        class A {
            var a: Int64 = 0
            public mut prop b: Int64 {
                get() {
                    return a
                }
                set(value) {
                    a = value
                }
            }
        }
    )

    let decl1 = parseDecl(input1)

    // Test APIs for PropDecl.
    let classDecl1 = (decl1 as ClassDecl).getOrThrow()
    let decls1 = classDecl1.body.decls
    if (decls1.size != 2) {
        return 1
    }
    if (!(decls1[1] is PropDecl)) {
        return 2
    }
    let propDecl = (decls1[1] as PropDecl).getOrThrow()

    if (propDecl.modifiers.size != 2) {
        return 3
    }
    if (propDecl.modifiers[0].keyword.value != "public") {
        return 4
    }
    if (propDecl.identifier.value != "b") {
        return 5
    }
    if ((propDecl.declType as PrimitiveType).getOrThrow().keyword.value != "Int64") {
        return 6
    }

    let setter1 = propDecl.setter
    let params = setter1.funcParams
    if (params.size != 1) {
        return 8
    }
    if (params[0].identifier.value != "value") {
        return 9
    }

    // Test ast to Tokens.
    let output1 = quote($decl1)
    let flag1 = compareTokens(input1, output1) // libast offers compareTokens
    if (!flag1) {
        return 10
    }

    if (propDecl.lBrace.kind == ILLEGAL) {
        return 11
    }
    if (propDecl.rBrace.kind == ILLEGAL) {
        return 12
    }
    if (propDecl.colon.kind == ILLEGAL) {
        return 13
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
