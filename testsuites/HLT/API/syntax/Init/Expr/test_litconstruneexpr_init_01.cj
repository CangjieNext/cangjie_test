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
        (LitConstKind.RuneLiteral, "a"),
        (LitConstKind.RuneLiteral, "这")
    ],
    isSingleQuote in [
        true,
        false
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
a 
*/"##)],
        [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Line, "// 2")]
    ]
]
func test_LitConstRuneExpr_Init_01(pairs: (LitConstKind, String), isSingleQuote: Bool, comments: Array<Comment>): Unit {
    let (kind, rawValue) = pairs
    let LitConstRuneExpr = LitConstRuneExpr(kind, rawValue, isSingleQuote, comments: comments)
    println(LitConstRuneExpr.toString())
    println()
}
