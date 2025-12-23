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

@Test
class test_01{
    @TestCase[
    cond in [
        //[],
        [
            AtomicCondition.Expression((parseText("a1 is Int64").node.getOrThrow() as Expr).getOrThrow()), 
            AtomicCondition.LetPatternCondition(LetPattern((parseText("a1 as Int64").node.getOrThrow() as Expr).getOrThrow(), [VarPattern("a"), VarPattern("b")]))
        ]
    ],
    comments in [
        [], 
        [Comment(##"/* 
a 
*/"##)],
        [Comment("//1"), Comment( "// 2")]
    ]
]
func test_ConjunctionCondition_Init_01(cond: Array<AtomicCondition>, comments: Array<Comment>): Unit {
    let ConjunctionCondition = ConjunctionCondition(cond, comments: comments)
    println(ConjunctionCondition.toString())
    println()
}
}

@Test
class test_02{
    @TestCase[
    cond in [
        [],
        // [
        //     AtomicCondition.Expression((parseText("a1 is Int64").node.getOrThrow() as Expr).getOrThrow()), 
        //     AtomicCondition.LetPatternCondition(LetPattern((parseText("a1 as Int64").node.getOrThrow() as Expr).getOrThrow(), [VarPattern("a"), VarPattern("b")]))
        // ]
    ],
    comments in [
        [], 
        [Comment(##"/* 
a 
*/"##)],
        [Comment("//1"), Comment( "// 2")]
    ]
]
func test_ConjunctionCondition_Init_02(cond: Array<AtomicCondition>, comments: Array<Comment>): Unit {
    @AssertThrows[Exception](ConjunctionCondition(cond, comments: comments))
   
}
}