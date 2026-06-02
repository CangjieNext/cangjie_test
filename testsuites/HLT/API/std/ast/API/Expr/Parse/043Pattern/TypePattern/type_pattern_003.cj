/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ParseASTException
// ASSERT: scan parsing expr error

import std.ast.*

main() {
    var input: Tokens = quote(
         match (a) {
            case day(1):((((M7_<I1_>)->G1_))->(G2_*G3_), (((M7_<I1_>)->G1.A<Int64>))->(G2_*G3_), (((M7_<I1_>)->Int64))->(G2_*G3_))-> (((M7_<I1_>)->G1_))->(G2_*G3_) if (true) => b
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var pattern = match (mh.matchCases[0] as MatchCase) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not MatchCase")
        }
        var patternType = match (pattern as TypePattern) {
            case Some(v) => v.pattern
            case None => throw Exception("Not TypePattern")
        }
        var patternTypeExpr = match (patternType as EnumPattern) {
            case Some(v) => v.constructor
            case None => throw Exception("Not EnumPattern")
        }
        var patternTypeExprValue = match (patternTypeExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var tp = match (pattern as TypePattern) {
            case Some(v) => v.patternType
            case None => throw Exception("Not TypePattern")
        }
        var tpExpr = match (tp as FuncType) {
            case Some(v) => v
            case None => throw Exception("Not FuncType")
        }
        var tpExpr0 = tpExpr.types[0]
        var tpExpr1 = tpExpr.types[1]
        var tpExpr2 = tpExpr.types[2]
        var tpExpr0Expr = match (tpExpr0 as FuncType) {
            case Some(v) => v.types[0]
            case None => throw Exception("Not FuncType")
        }
        var tpExpr0ParenExpr = match (tpExpr0Expr as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var tpExpr0ParenExpr2 = match (tpExpr0ParenExpr as FuncType) {
            case Some(v) => v.types[0]
            case None => throw Exception("Not FuncType")
        }
        var tpExpr0ParenExprType = match (tpExpr0ParenExpr2 as RefType) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not RefType")
        }
        var tpExpr0ParenExprTypeValue = match (tpExpr0ParenExprType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var tpExpr1Expr = match (tpExpr1 as FuncType) {
            case Some(v) => v.types[0]
            case None => throw Exception("Not FuncType")
        }
        var tpExpr1ParenExpr = match (tpExpr1Expr as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var tpExpr1ParenExpr2 = match (tpExpr1ParenExpr as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        var tpExpr1ParenExprType = match (tpExpr1ParenExpr2 as QualifiedType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not QualifiedType")
        }
        var tpExpr2Expr = match (tpExpr2 as FuncType) {
            case Some(v) => v.types[0]
            case None => throw Exception("Not FuncType")
        }
        var tpExpr2ParenExpr = match (tpExpr2Expr as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var tpExpr2ParenExpr2 = match (tpExpr2ParenExpr as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        var tpExpr2ParenExprType = match (tpExpr2ParenExpr2 as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        var tpExprRet = tpExpr.returnType
        var tpExprRetExpr = match (tpExprRet as FuncType) {
            case Some(v) => v.returnType
            case None => throw Exception("Not FuncType")
        }
        var tpExprRetParenExpr = match (tpExprRetExpr as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var tpExprRetParenExpr2 = match (tpExprRetParenExpr as TupleType) {
            case Some(v) => v.types[0]
            case None => throw Exception("Not FuncType")
        }
        var tpExprRetParenExpr2Type = match (tpExprRetParenExpr2 as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (!(pattern is TypePattern) || patternTypeExprValue != "day" || tpExpr0ParenExprTypeValue != "I1_" ||
            tpExpr1ParenExprType != "A" || tpExpr2ParenExprType != "Int64" || tpExprRetParenExpr2Type != "G2_") {
            return 6
        }
        return 0
    }
    return 1
}
