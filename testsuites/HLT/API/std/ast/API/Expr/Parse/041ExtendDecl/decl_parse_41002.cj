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

main(): Int64 {
    var input: Tokens = quote(
        extend<K> A<K> {
            public func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
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
        var typeExpr = match (ex.extendType as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (typeExpr != "A") {
            return 3
        }
        if (ex.superTypes.size != 0) {
            return 4
        }
        var bodyExpr = match (ex.body as Body) {
            case Some(v) => v.decls[0]
            case None => throw Exception("Not Body")
        }
        var funcextend = match (bodyExpr as FuncDecl) {
            case Some(v) => v
            case None => throw Exception("Not FuncDecl")
        }
        if (funcextend.identifier.value != "foo") {
            return 5
        }
        if (ex.genericConstraint.size != 0) {
            return 7
        }
        return 0
    }
    return 1
}
