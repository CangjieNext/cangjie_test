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
import std.unicode.*

main() {
    var input: Tokens = quote(
         public type A<T, V> = B<Int64>
    )
    let expr = parseDecl(input)
    if (expr is TypeAliasDecl) {
        var aDec = match (expr as TypeAliasDecl) {
            case Some(v) => v
            case None => throw Exception("Not TypeAliasDecl")
        }
        var modifier = aDec.modifiers[0]
        var modifiersExpr = match (modifier as Modifier) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not Modifier")
        }
        var typeExpr = aDec.keyword.value
        var identifierExpr = aDec.identifier.value
        var aliasTypeExpr = aDec.aliasType
        var aliasRefTypeExpr = match (aliasTypeExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var aliasIntExpr = match (aliasTypeExpr as RefType) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not RefType")
        }
        var aliasIntExprValue = match (aliasIntExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        var aliasTV = aDec.genericParam
        var aliasTVExpr = match (aliasTV as GenericParam) {
            case Some(v) => v.parameters
            case None => throw Exception("Not GenericParam")
        }
        if (modifiersExpr != "public" || typeExpr != "type" || identifierExpr != "A" || aliasRefTypeExpr != "B" ||
            aliasIntExprValue != "Int64" || aliasTVExpr.toString() != "T V") {
            return 1
        }
        return 0
    }
    return 1
}
