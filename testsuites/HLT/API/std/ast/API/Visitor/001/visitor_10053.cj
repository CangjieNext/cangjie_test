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
// ASSERT: scan EnumDecl
// ASSERT: scan GenericParam
// ASSERT: scan GenericConstraint
// ASSERT: scan RefType
// ASSERT: scan RefType
// ASSERT: scan Constructor
// ASSERT: scan Constructor
// ASSERT: scan RefType
// ASSERT: scan Constructor
// ASSERT: scan RefType
// ASSERT: scan RefType

import std.ast.*

var res = 0

main() {
    let input = quote(
         enum X<T> where T<: A{
            a|b(T)|b(T,T)
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
