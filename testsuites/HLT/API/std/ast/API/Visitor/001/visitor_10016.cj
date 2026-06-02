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
// ASSERT: scan VarDecl
// ASSERT: scan-5 CallExpr
// ASSERT: scan-5 RefExpr
// ASSERT: scan-4 Argument
import std.ast.*

var res = 0

main() {
    let input = quote(
    var x = a(b(c(d(e()))))
    )
    let vardecl = parseDecl(input)
    let visitor = MyVisitor()
    vardecl.traverse(visitor)

    return 0
}
