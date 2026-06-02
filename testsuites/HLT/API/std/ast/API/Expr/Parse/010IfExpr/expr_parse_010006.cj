/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(if(a){1}else if(false){b} else if (x){c} else {d})
    let expr = parseExpr(input)
    if (expr is IfExpr) {
        var ifExpr = match (expr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not Exception")
        }
        var condExpr = ifExpr.condition
        var ifBody = ifExpr.ifBlock
        var elseBody = ifExpr.elseExpr
        var condExprValue = match (condExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var ifBodyExpr = match (ifBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var ifBodyExprValue = match (ifBodyExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var elseIfExpr = match (elseBody as IfExpr) {
            case Some(v) => v.keywordI.value
            case None => throw Exception("Not IfExpr")
        }
        var elsecondExpr = match (elseBody as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }
        var elsecondExprValue = match (elsecondExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var elseifBody = match (elseBody as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var elseifBodyExpr = match (elseifBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseifBodyExprValue = match (elseifBodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var elseifelseifBody = match (elseBody as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var elseIfelseIfExpr = match (elseifelseifBody as IfExpr) {
            case Some(v) => v.keywordI.value
            case None => throw Exception("Not IfExpr")
        }
        var elseelseIfcondExpr = match (elseifelseifBody as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }
        var elseelseIfcondExprValue = match (elseelseIfcondExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var elseifelseifBlock = match (elseifelseifBody as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var elseifelseifBlockExpr = match (elseifelseifBlock as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseifelseifBlockExprValue = match (elseifelseifBlockExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var elseifelseifkeywordE = match (elseifelseifBody as IfExpr) {
            case Some(v) => v.keywordE.value
            case None => throw Exception("Not IfExpr")
        }
        var elseifelseelseifelse = match (elseifelseifBody as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var elseifelseelseifelseExpr = match (elseifelseelseifelse as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseifelseelseifelseExprValue = match (elseifelseelseifelseExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (condExprValue != "a" || ifBodyExprValue != "1" || elseIfExpr != "if" || elsecondExprValue != "false" ||
            elseifBodyExprValue != "b" || elseIfelseIfExpr != "if" || elseelseIfcondExprValue != "x" ||
            elseifelseifBlockExprValue != "c" || elseifelseifkeywordE != "else" || elseifelseelseifelseExprValue != "d") {
            return 1
        }
        return 0
    }
    return 10
}
