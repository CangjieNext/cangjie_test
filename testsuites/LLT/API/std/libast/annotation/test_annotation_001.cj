// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*

main(): Int64 {
    let input = quote(
        enum E {
            @API1[11]
            caseA |
            @!API2[11]
            @!API3[11]
            caseB(Int64, Bool)
        }
    )
    let enumDecl = (parseDecl(input) as EnumDecl).getOrThrow()
    if (enumDecl.constructors[1].annotations.size != 2) {
        return 1
    }
    let annos = enumDecl.constructors[1].annotations
    if (annos[0].identifier.value != "API2" || annos[1].identifier.value != "API3") {
        return 2
    }
    if (annos[0].at.kind != TokenKind.AT_EXCL || annos[1].at.kind != TokenKind.AT_EXCL) {
        return 3
    }
    enumDecl.dump()
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
