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
    expr in [
        AsExpr(LitConstExpr(LitConstKind.IntergerLiteral, "123"), AtomicType(Int64Type))
    ],
    patterns in [
       // [],
        [ConstPattern(LitConstExpr(LitConstKind.BoolLiteral, "true"))],
        [ConstPattern(LitConstExpr(LitConstKind.BoolLiteral, "false")), ConstPattern(LitConstExpr(LitConstKind.FloatLiteral, "0.1f32"))]
    ],
    comments in [
        [], 
//         [Comment(CommentKind.Block, ##"/* 
// a 
// */"##)],
//         [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Line, "// 2")]
    ]
]
func test_LetPattern_Init_01(expr: Expr, patterns: Array<Pattern>, comments: Array<Comment>): Unit {
    let LetPattern = LetPattern(expr, patterns, comments: comments)
    println(LetPattern.toString())
    println()
}

@Test[
    expr in [
        AsExpr(LitConstExpr(LitConstKind.IntergerLiteral, "123"), AtomicType(Int64Type))
    ],
    patterns in [
       [],
        // [ConstPattern(LitConstExpr(LitConstKind.BoolLiteral, "true"))],
        // [ConstPattern(LitConstExpr(LitConstKind.BoolLiteral, "false")), ConstPattern(LitConstExpr(LitConstKind.FloatLiteral, "0.1f32"))]
    ],
    comments in [
        [], 
//         [Comment(CommentKind.Block, ##"/* 
// a 
// */"##)],
//         [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Line, "// 2")]
    ]
]
func test_LetPattern_Init_02(expr: Expr, patterns: Array<Pattern>, comments: Array<Comment>): Unit {
    @AssertThrows[Exception](LetPattern(expr, patterns, comments: comments))
}