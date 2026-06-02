/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var code = "public macro X (input:Tokens) : Tokens { return input }"
    let expr = parseDecl(cangjieLex(code))
    // Test Modifier.
    var macroDecl = match (expr as MacroDecl) {
        case Some(v) => v
        case None => throw Exception("Not MacroDecl")
    }
    // Test Modifier.
    let modifierExpr = macroDecl.modifiers
    var modifierExpr0 = match (modifierExpr[0] as Modifier) {
        case Some(v) => v.keyword.value
        case None => throw Exception("Not Modifier")
    }

    // Test Keyword.
    var keywordExpr = macroDecl.keyword.value

    // Test Identifier.
    var identifierExpr = macroDecl.identifier.value

    // Test FuncParamList.
    let params = macroDecl.funcParams
    let params0 = match (params[0] as FuncParam) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not FuncParam")
    }

    // Test FuncType.
    let typeExpr = macroDecl.declType
    let typeExprValue = match (typeExpr as RefType) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefType")
    }

    // Test FuncBody.
    let body = macroDecl.block
    let bodyExpr = match (body as Block) {
        case Some(v) => v.nodes
        case None => throw Exception("Not Block")
    }
    if (modifierExpr.size != 1 || modifierExpr0 != "public" || keywordExpr != "macro" || identifierExpr != "X" ||
        params.size != 1 || params0 != "input" || typeExprValue != "Tokens" || bodyExpr.size != 1) {
        return 1
    }
    return 0
}
