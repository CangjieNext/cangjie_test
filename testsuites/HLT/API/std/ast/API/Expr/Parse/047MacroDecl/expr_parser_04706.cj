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

class MyVisitor <: Visitor {
    public var v = 0
    public override func visit(macroDecl: MacroDecl): Unit {
        let modifierExpr = macroDecl.modifiers
        if (modifierExpr.size != 1) {
            v = 1
        }
        var modifierExpr0 = match (modifierExpr[0] as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        if (modifierExpr0 != "public") {
            v = 2
        }
        // Test Keyword.
        var keywordExpr = macroDecl.keyword.value
        if (keywordExpr != "macro") {
            v = 3
        }
        // Test Identifier.
        var identifierExpr = macroDecl.identifier.value
        if (identifierExpr != "X") {
            v = 4
        }
        // Test FuncParamList.
        let params = macroDecl.funcParams
        let params0 = match (params[0] as FuncParam) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncParam")
        }
        if (params.size != 1) {
            v = 5
        }
        if (params0 != "input") {
            v = 6
        }
        // Test FuncType.
        let typeExpr = macroDecl.declType
        let typeExprValue = match (typeExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (typeExprValue != "Tokens") {
            v = 7
        }
        // Test FuncBody.
        let body = macroDecl.block
        let bodyExpr = match (body as Block) {
            case Some(v) => v.nodes
            case None => throw Exception("Not Block")
        }
        if (bodyExpr.size != 1) {
            v = 1
        }
        return
    }
}

main() {
    var input = quote(public macro X (input:Tokens) : Tokens { return input })
    let expr = parseDecl(input)
    var macroDecl = match (expr as MacroDecl) {
        case Some(v) => v
        case None => throw Exception("Not MacroDecl")
    }
    let myVisitor = MyVisitor()
    macroDecl.traverse(myVisitor)
    return myVisitor.v
}
