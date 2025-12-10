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
    body in [
        [],
    ],
    params in [
        (parseText("func foo(a: Int64)").node.getOrThrow() as FuncDecl).getOrThrow().params,
        ParameterList(LambdaParam("a1", None)),
        ParameterList(LambdaParam("b1", AtomicType(AtomicTypeKind.Float16Type)))
    ],
    comments in [
        [], 
        [Comment(##"/* 
    ccc
*/"##)]
    ]
]
func test_Lambda_Init_01(body: Array<SyntaxTreeNode>, params: ParameterList, comments: Array<Comment>): Unit {
    let Lambda = Lambda(body, params, comments: comments)
    println(Lambda.toString())
    println()
}