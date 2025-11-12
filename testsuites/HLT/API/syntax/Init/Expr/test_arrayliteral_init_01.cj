/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test[
    elements in [
        [],
        [LitConstExpr(LitConstKind.IntergerLiteral, "123"), LitConstExpr(LitConstKind.IntergerLiteral, "456")],
        [LitConstExpr(LitConstKind.IntergerLiteral, "123"), LitConstExpr(LitConstKind.BoolLiteral, "true")]
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
a 
*/"##)],
        [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Line, "// 2")]
    ]
]
func test_ArrayLiteral_Init_01(elements: Array<Expr>, comments: Array<Comment>): Unit {
    let ArrayLiteral = ArrayLiteral(elements, comments: comments)
    println(ArrayLiteral.toString())
    println()
}
