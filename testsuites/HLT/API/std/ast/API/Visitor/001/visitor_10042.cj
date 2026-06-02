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
// ASSERT: scan TryExpr
// ASSERT: scan Block
// ASSERT: scan Block
// ASSERT: scan TryExpr
// ASSERT: scan Block
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
// ASSERT: scan TryExpr
// ASSERT: scan Block
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
// ASSERT: scan Block
// ASSERT: scan TryExpr
// ASSERT: scan Block
// ASSERT: scan TryExpr
// ASSERT: scan Block
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
// ASSERT: scan Block
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
// ASSERT: scan TryExpr
// ASSERT: scan Block
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
// ASSERT: scan Block
// ASSERT: scan Block
// ASSERT: scan TryExpr
// ASSERT: scan Block
// ASSERT: scan WildcardPattern
// ASSERT: scan Block
// ASSERT: scan Block
import std.ast.*

var res = 0

main() {
    let input = quote(
         func x(){

            try{}finally{}
            try{} catch (_){}
            try{} catch (_){} finally{}
            try{try{} catch (_){} finally{}} catch (_){try{} catch (_){} finally{}} finally{try{} catch (_){} finally{}}
         }
    )
    let decl = parseDecl(input)
    let visitor = MyVisitor()
    decl.traverse(visitor)

    return 0
}
