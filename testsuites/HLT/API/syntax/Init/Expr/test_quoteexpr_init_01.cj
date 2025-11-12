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
    tokensOrRefExpr in [
        [],
        (parseText("quote(aaa)").node.getOrThrow() as QuoteExpr).getOrThrow().tokensOrRefExpr,
        (parseText(##"quote(
    arr = $(intList)
    x = $(float)
    s = $(str)
)"##).node.getOrThrow() as QuoteExpr).getOrThrow().tokensOrRefExpr
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
    ccc
*/"##)]
    ]
]
func test_QuoteExpr_Init_01(tokensOrRefExpr: Array<QuoteExprContent>, comments: Array<Comment>): Unit {
    let QuoteExpr = QuoteExpr(tokensOrRefExpr, comments: comments)
    println(QuoteExpr.toString())
    println()
}