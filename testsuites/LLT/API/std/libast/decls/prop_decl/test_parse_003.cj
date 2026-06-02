// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.unicode.*

main(): Int64 {
    let input4 = quote(
        class A {
            prop i: Int64 {
                get() {
                    return 0
                }
            }
        }
    )

    let decl4 = parseDecl(input4)

    let classDecl4 = (decl4 as ClassDecl).getOrThrow()
    let decls4 = classDecl4.body
    if (decls4.decls.size != 1) {
        return 1
    }
    let propToken = decls4.decls[0].toTokens()
    var propDecl = (parseDecl(propToken) as PropDecl).getOrThrow()

    let flag1 = compareTokens(propToken, quote($propDecl))
    if (!flag1) {
        return 2
    }
    let flag2 = compareTokens(propDecl.toTokens(), propToken)
    if (!flag2) {
        return 3
    }

    propDecl = PropDecl(propToken)
    let flag3 = compareTokens(propToken, quote($propDecl))
    if (!flag3) {
        return 4
    }
    let flag4 = compareTokens(propDecl.toTokens(), propToken)
    if (!flag4) {
        return 5
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
