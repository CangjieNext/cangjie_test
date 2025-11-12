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
    pairs in [
        (CommentKind.Line, "// a"),
        (CommentKind.Block, "/* a */"),
        (CommentKind.Document, "/** a */"),
        (CommentKind.Block, ##"/*
    a
*/"##),
    ]
]
func test_Comment_Init_01(pairs: (CommentKind, String)): Unit {
    let (kind, content) = pairs
    let Comment = Comment(kind, content)
    println(Comment.toString())
    println()
}

@Test[
    pairs in [
        (CommentKind.Block, "// a"),
        (CommentKind.Line, "/* a */"),
        (CommentKind.Block, "/** a */"),
        (CommentKind.Document, ##"/*
    a
*/"##),
        (CommentKind.Line, "/a"),
    ]
]
func test_Comment_Init_02(pairs: (CommentKind, String)): Unit {
    let (kind, content) = pairs
    @AssertThrows[Exception](Comment(kind, content))
}