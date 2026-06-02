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
// ASSERT: scan RangeExpr
// ASSERT: scan LitConstExpr
// ASSERT: scan LitConstExpr
// ASSERT: scan RangeExpr
// ASSERT: scan RefExpr
// ASSERT: scan RefExpr
// ASSERT: scan RangeExpr
// ASSERT: scan RefExpr
// ASSERT: scan RefExpr
// ASSERT: scan RefExpr
// ASSERT: scan RangeExpr
// ASSERT: scan RefExpr
// ASSERT: scan RefExpr
// ASSERT: scan RefExpr
// ASSERT: scan \n
// ASSERT: scan RefExpr
// ASSERT: scan RangeExpr
// ASSERT: scan LitConstExpr
// ASSERT: scan \n
// ASSERT: scan RefExpr
// ASSERT: scan RangeExpr
// ASSERT: scan LitConstExpr
import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){

            1..10
            a..=b
            a..b:c
            a..=b:c
            a[1..]
            a[..1]
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
