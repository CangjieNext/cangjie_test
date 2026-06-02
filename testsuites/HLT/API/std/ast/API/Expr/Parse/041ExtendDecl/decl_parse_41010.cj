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
// ASSERT: scan parsing decl error

import std.ast.*

main(): Int64 {
    var input: Tokens = quote(
        extend (Int64) {
            public func foo<T>(a:T, b!:Int64=1): Int64 where T<: B {}
        }
    )
    let expr = parseDecl(input)
    if (expr is ExtendDecl) {
        var ex = match (expr as ExtendDecl) {
            case Some(v) => v
            case None => throw Exception("Not ExtendDecl")
        }
        if (ex.keyword.value != "extend") {
            return 2
        }
        var eq = match (ex.extendType as ParenType) {
            case Some(v) => v.parenthesizedType
            case None => throw Exception("Not ParenType")
        }
        var eqType = match (eq as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (eqType != "Int64") {
            return 3
        }
        if (ex.superTypes.size != 0) {
            return 4
        }
        var ebody = match (ex.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        var ebodyExpr = match (ebody as FuncDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not FuncDecl")
        }
        if (ebodyExpr != "foo") {
            return 5
        }
        if (ex.genericConstraint.size != 0) {
            return 6
        }

        return 0
    }
    return 1
}
