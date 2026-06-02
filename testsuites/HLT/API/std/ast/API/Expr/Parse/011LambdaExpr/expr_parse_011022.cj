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
    var input: Tokens = quote({a:Int32=> b[a] })
    let expr = parseExpr(input)
    if (expr is LambdaExpr) {
        var b = match (expr as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }
        var lValue = b.lBrace.value
        var rValue = b.rBrace.value
        var dValue = b.doubleArrow.value
        if (lValue != "{" || rValue != "}" || dValue != "=>") {
            return 1
        }

        var funcExpr = match (b.funcParams[0] as FuncParam) {
            case Some(v) => v
            case None => throw Exception("Not FuncParam")
        }

        var aValue = funcExpr.identifier.value
        var conValue = funcExpr.colon.value
        var typeExpr = funcExpr.paramType
        var typeValue = match (typeExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (aValue != "a" || conValue != ":" || typeValue != "Int32") {
            return 2
        }

        var nodesArray = b.nodes
        var subExpr = match (nodesArray[0] as SubscriptExpr) {
            case Some(v) => v
            case None => throw Exception("Not SubscriptExpr")
        }

        var lsq = subExpr.lSquare.value
        var rsq = subExpr.rSquare.value

        var bExpr = subExpr.baseExpr
        var bValue1 = match (bExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var arrlist = subExpr.indexList
        var aValue1 = match (arrlist[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (lsq != "[" || rsq != "]" || aValue1 != "a" || bValue1 != "b") {
            return 3
        }

        return 0
    }
    return 10
}
