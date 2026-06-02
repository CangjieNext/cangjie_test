/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan FuncDecl
// ASSERT: scan GenericParam
// ASSERT: scan FuncParam
// ASSERT: scan RefType
// ASSERT: scan GenericConstraint
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan MemberAccess
// ASSERT: scan PrimitiveTypeExpr
import std.ast.*

var res = 0

main() {
    let input = quote(
        func x<T>(a:T) where T <: A{
            Int64.a
        }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
