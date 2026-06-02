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
// ASSERT: scan TupleLiteral
// ASSERT: scan-7 LitConstExpr
// ASSERT: scan ReturnExpr
import std.ast.*

var res = 0

main() {
    let input = quote(
    var x = (1,0.1,return,"123${a}",'a',0b10,0XFF,#"x"#)
    )
    let vardecl = parseDecl(input)
    let visitor = MyVisitor()
    vardecl.traverse(visitor)

    return 0
}
