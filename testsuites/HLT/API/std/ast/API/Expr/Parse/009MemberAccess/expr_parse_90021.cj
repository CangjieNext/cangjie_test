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
    var input: Tokens = quote(a.b<T,V>)
    let expr = parseExpr(input)
    if (expr is MemberAccess) {
        var b = match (expr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }

        var aExpr = b.baseExpr
        var aValue = match (aExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var dotVaule = b.dot.value
        var fieldVaule = b.field.value
        var lValue = b.lAngle.value
        var rValue = b.rAngle.value

        if (aValue != "a" || dotVaule != "." || fieldVaule != "b" || lValue != "<" || rValue != ">") {
            return 1
        }

        var argArray = b.typeArguments
        var valueT = match (argArray[0] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var valueV = match (argArray[1] as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (valueT != "T" || valueV != "V") {
            return 2
        }
        return 0
    }
    return 3
}
