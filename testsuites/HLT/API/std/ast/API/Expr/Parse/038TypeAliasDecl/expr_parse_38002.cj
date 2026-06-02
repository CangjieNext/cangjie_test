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
         type A = Int64
    )
    let expr = parseDecl(input)
    if (expr is TypeAliasDecl) {
        var aDec = match (expr as TypeAliasDecl) {
            case Some(v) => v
            case None => throw Exception("Not TypeAliasDecl")
        }
        var mod = aDec.modifiers.size
        var typeExpr = aDec.keyword.value
        var identExpr = aDec.identifier.value
        var tp = aDec.aliasType
        var tpExpr = match (tp as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not TypeAliasDecl")
        }
        if (mod != 0 || typeExpr != "type" || identExpr != "A" || tpExpr != "Int64") {
            return 1
        }
        return 0
    }
    return 1
}
