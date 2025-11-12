/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test[
    pairs in [
        (LitConstKind.BoolLiteral, "true"),
        (LitConstKind.BoolLiteral, "false"),
        (LitConstKind.FloatLiteral, "0.1f32"),
        (LitConstKind.IntergerLiteral, "-1"),
        (LitConstKind.UnitLiteral, "()")
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
a 
*/"##)],
        [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Line, "// 2")]
    ]
]
func test_LitConstExpr_Init_01(pairs: (LitConstKind, String), comments: Array<Comment>): Unit {
    let (kind, rawValue) = pairs
    let LitConstExpr = LitConstExpr(kind, rawValue, comments: comments)
    println(LitConstExpr.toString())
    println()
}

@Test[
    pairs in [
        (LitConstKind.BoolLiteral, "aaa"),
        (LitConstKind.FloatLiteral, "1"),
        (LitConstKind.IntergerLiteral, "-0.1f32"),
        (LitConstKind.RuneLiteral, "aaaaaaa仓颉"),
        (LitConstKind.UnitLiteral, "a")
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
a 
*/"##)]
    ]
]
func test_LitConstExpr_Init_02(pairs: (LitConstKind, String), comments: Array<Comment>): Unit {
    let (kind, rawValue) = pairs
    @AssertThrows[Exception](LitConstExpr(kind, rawValue, comments: comments))
}