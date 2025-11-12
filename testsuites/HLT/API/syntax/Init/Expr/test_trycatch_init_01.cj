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
    catchBlocks in [
        // [],
        [Block((parseText("b + 1").node.getOrThrow() as Expr).getOrThrow())]
    ],
    catchPatterns in [
        [],
        [CatchPattern(VarPattern("e1"), [CompositeType("AException", [], []), CompositeType("BException", [], [])])]
    ],
    finallyBlock in [
        None,
        Block((parseText("c + 1").node.getOrThrow() as Expr).getOrThrow())
    ],
    resourceSpec in [
        [],
        // [(parseText("r = source()").node.getOrThrow() as VarDecl).getOrThrow()]
    ],
    tryBlock in [
        Block((parseText("a + 1").node.getOrThrow() as Expr).getOrThrow())
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
    ccc
*/"##)]
    ]
]
func test_TryCatch_Init_01(catchBlocks: Array<Block>, catchPatterns: Array<CatchPattern>, finallyBlock: Option<Block>, 
    resourceSpec: Array<VarDecl>, tryBlock: Block, comments: Array<Comment>): Unit {
    let TryCatch = TryCatch(catchBlocks, catchPatterns, finallyBlock, resourceSpec, tryBlock, comments: comments)
    println(TryCatch.toString())
    println()
}