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
// ASSERT: scan-4 IsExpr
// ASSERT: scan-2 PrefixType
// ASSERT: scan-4 RefExpr
// ASSERT: scan PrimitiveType
import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){

            a is ?A
            b is ??B
            c is Option<Int64> // not OptionType ast
            d is None // not OptionType ast
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
