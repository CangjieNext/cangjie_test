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
// ASSERT: scan ForInExpr
// ASSERT: scan VarPattern
// ASSERT: scan RefExpr
// ASSERT: scan ReturnExpr
// ASSERT: scan Block
// ASSERT: scan ForInExpr
// ASSERT: scan VarPattern
// ASSERT: scan RefExpr
// ASSERT: scan Block
// ASSERT: scan ForInExpr
// ASSERT: scan VarPattern
// ASSERT: scan ArrayLiteral
// ASSERT: scan LitConstExpr
// ASSERT: scan LitConstExpr
// ASSERT: scan LitConstExpr
// ASSERT: scan Block
// ASSERT: scan ForInExpr
// ASSERT: scan VarPattern
// ASSERT: scan RangeExpr
// ASSERT: scan LitConstExpr
// ASSERT: scan LitConstExpr
// ASSERT: scan Block
import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){
            for (a in b where return){}
            for (a in b){}
            for (a in [1,2,3]){}
            for (a in 1..10){}
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
