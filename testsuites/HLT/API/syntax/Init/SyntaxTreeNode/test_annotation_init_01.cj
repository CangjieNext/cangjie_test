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
    arguments in [
        [],
        [Argument(None, false, false, LitConstExpr(LitConstKind.IntergerLiteral, "123"))],
        (parseText("foo(a1)").node.getOrThrow() as CallExpr).getOrThrow().arguments,
        (parseText("foo(inout aaaa, b: 1234)").node.getOrThrow() as CallExpr).getOrThrow().arguments,
        (parseText("foo(\"1234\", strict: false)").node.getOrThrow() as CallExpr).getOrThrow().arguments
    ],
    identifier in [
        "a1",
        "Anno1",
        "Deprecated"
    ],
    opKind in [
        AtOpKind.At,
        AtOpKind.AtExcl
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
a 
*/"##)],
        [Comment(CommentKind.Document, "/** a */")],
        [Comment(CommentKind.Line, "// a")],
        [Comment(CommentKind.Line, "//1"), Comment(CommentKind.Line, "// 2")]
    ]
]
func test_Annotation_Init_01(arguments: Array<Argument>, identifier: String, opKind: AtOpKind, comments: Array<Comment>): Unit {
    let annotation = Annotation(arguments, identifier, opKind, comments: comments)
    println(annotation.toString())
    println()
}

@Test
func test_Annotation_Init_02(): Unit {
    @AssertThrows[Exception](Annotation([], "", At))
}
