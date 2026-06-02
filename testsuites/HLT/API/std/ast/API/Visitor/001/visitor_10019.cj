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
// ASSERT: scan-6 AssignExpr
// ASSERT: scan-9 RefExpr
// ASSERT: scan-4 LitConstExpr
// ASSERT: scan TupleLiteral
// ASSERT: scan LambdaExpr

import std.ast.*

var res = 0

main() {
    let input = quote(
    func x(){
        a = b;
        a = 123
        a = a
        a = (1,2,3)
        a = {=> a = b}
    }
    )
    let vardecl = parseDecl(input)
    let visitor = MyVisitor()
    vardecl.traverse(visitor)

    return 0
}
