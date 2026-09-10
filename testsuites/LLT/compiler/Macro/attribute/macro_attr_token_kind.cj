// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    // identifier attribute: value keeps raw text, kind is IDENTIFIER
    let tokens1 = quote(@Attribute[State] var cnt = 0)
    let decl1 = VarDecl(tokens1)
    let attrs1 = decl1.getAttrs()
    if (attrs1.size != 1) {
        return 1
    }
    if (attrs1[0].kind != TokenKind.IDENTIFIER || attrs1[0].value != "State") {
        return 2
    }
    if (!decl1.hasAttr("State")) {
        return 3
    }

    // string attribute: kind is STRING_LITERAL, value keeps text without quotes
    let tokens2 = quote(@Attribute["Binding"] var bcnt = 0)
    let decl2 = VarDecl(tokens2)
    let attrs2 = decl2.getAttrs()
    if (attrs2.size != 1) {
        return 4
    }
    if (attrs2[0].kind != TokenKind.STRING_LITERAL || attrs2[0].value != "Binding") {
        return 5
    }
    if (!decl2.hasAttr("Binding")) {
        return 6
    }

    // mixed attributes in one annotation
    let tokens3 = quote(@Attribute["Binding", State] var v = 0)
    let decl3 = VarDecl(tokens3)
    let attrs3 = decl3.getAttrs()
    if (attrs3.size != 2) {
        return 7
    }
    if (attrs3[0].kind != TokenKind.STRING_LITERAL || attrs3[0].value != "Binding") {
        return 8
    }
    if (attrs3[1].kind != TokenKind.IDENTIFIER || attrs3[1].value != "State") {
        return 9
    }
    return 0
}
