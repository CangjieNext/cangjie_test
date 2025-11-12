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
    identifier_pair in [
        ("a1", true),
        (None, false)
    ],
    isInOut in [
        true,
        false
    ],
    value in [
        parseText("foo(a1)").node.getOrThrow() as Expr,
        parseText("\"LitConstExpr\"").node.getOrThrow() as Expr,
        parseText("if (true) {a} else {b}").node.getOrThrow() as Expr
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
a 
*/"##)],
        [Comment(CommentKind.Document, "/** a */")],
        [Comment(CommentKind.Line, "// a")],
        [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Block, ##"/* 
a 
*/"##)]
    ]
]
func test_Argument_Init_01(identifier_pair: (Option<String>, Bool), isInOut: Bool, value: ?Expr, comments: Array<Comment>): Unit {
    let (identifier, isNamed) = identifier_pair
    let Argument = Argument(identifier, isInOut, isNamed, value.getOrThrow(), comments: comments)
    println(Argument.toString())
    println()
}

@Test[
    identifier_pair in [
        ("a1", false),
        (None, true)
    ],
    isInOut in [
        true,
        false
    ],
    value in [
        parseText("foo(a1)").node.getOrThrow() as Expr,
        parseText("\"LitConstExpr\"").node.getOrThrow() as Expr,
        parseText("if (true) {a} else {b}").node.getOrThrow() as Expr
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
a 
*/"##)],
        [Comment(CommentKind.Document, "/** a */")],
        [Comment(CommentKind.Line, "// a")],
        [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Block, ##"/* 
a 
*/"##)]
    ]
]
func test_Argument_Init_02(identifier_pair: (Option<String>, Bool), isInOut: Bool, value: ?Expr, comments: Array<Comment>): Unit {
    let (identifier, isNamed) = identifier_pair
    @AssertThrows[Exception](Argument(identifier, isInOut, isNamed, value.getOrThrow(), comments: comments))
}
