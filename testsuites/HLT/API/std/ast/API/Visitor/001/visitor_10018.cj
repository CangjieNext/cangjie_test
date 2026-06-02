/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj -o %output -Woff unused
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan FuncDecl
// ASSERT: scan-4 ReturnExpr
// ASSERT: scan-2 RefExpr

import std.ast.*

var res = 0

main() {
    let input = quote(
    func x(){
        return ;
        return a;
        return return a;
    }
    )
    let vardecl = parseDecl(input)
    let visitor = MyVisitor()
    vardecl.traverse(visitor)

    return 0
}
