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
// ASSERT: scan MatchExpr
// ASSERT: scan RefExpr
// ASSERT: scan MatchCase
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
// ASSERT: scan LitConstExpr
// ASSERT: scan MatchCase
// ASSERT: scan TuplePattern
// ASSERT: scan VarOrEnumPattern
// ASSERT: scan VarOrEnumPattern
// ASSERT: scan Block
// ASSERT: scan LitConstExpr
// ASSERT: scan MatchCase
// ASSERT: scan TypePattern
// ASSERT: scan VarPattern
// ASSERT: scan PrimitiveType
// ASSERT: scan Block
// ASSERT: scan LitConstExpr
// ASSERT: scan MatchCase
// ASSERT: scan VarOrEnumPattern
// ASSERT: scan Block
// ASSERT: scan LitConstExpr
// ASSERT: scan MatchCase
// ASSERT: scan VarOrEnumPattern
// ASSERT: scan VarOrEnumPattern
// ASSERT: scan Block
// ASSERT: scan LitConstExpr
// ASSERT: scan MatchCase
// ASSERT: scan WildcardPattern
// ASSERT: scan ParenExpr
// ASSERT: scan RefExpr
// ASSERT: scan Block
// ASSERT: scan LitConstExpr

import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){

            match (a){
                case _ => 1
                case (a,b) => 1
                case a : Int64 => 1
                case X => 1
                case X | Y => 1
                case _ where (a) => 1
            }
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
