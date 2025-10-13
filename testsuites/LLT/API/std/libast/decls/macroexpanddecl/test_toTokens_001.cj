// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(){
    let decl1 = MacroExpandDecl(quote(
        @M
        class A{}
    ))
    decl1.macroInputDecl = parseDecl(quote(struct B{}))
    let flag1 = compareTokens(decl1.macroInputDecl.toTokens(), decl1.macroInputs)
    if (!flag1) {
        return 1
    }

    let decl2 = MacroExpandDecl(quote(
        @M
        class A{}
    ))
    decl2.macroInputs = quote(struct B{})
    let flag2 = compareTokens(decl2.macroInputDecl.toTokens(), decl2.macroInputs)
    if (!flag2) {
        return 2
    }

    let decl3 = MacroExpandDecl(quote(
        @M
        class A{}
    ))
    decl3.macroInputs = quote(aa)
    decl3.macroInputs.toTokens().dump()
    var flag3 = true
    try { 
        decl3.macroInputDecl
    } catch (e: ASTException) {
        flag3 = false
    }
    if (!flag3) {
        return 3
    }
    0
}

/* SCAN-IN
description: identifier, token_id: 137, token_literal_value: aa, fileID: 1, line: 31, column: 31
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 