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

@Test
class test_01{
    @TestCase[
    name in [
        "a1",
        "aaaa"
    ],
    typeAnnotation in [
        None,
        AtomicType(AtomicTypeKind.Float16Type),
    ],
    annotations in [
        [],
        [Annotation([Argument(None, false, LitConstExpr(LitConstKind.IntergerLiteral, "123"))], "MyAnno", AtOpKind.At)]
    ],
    // modifiers in [
    //     [],
    //     // [Modifier(ModifierKind.Public)]
    // ],
    comments in [
        [], 
//         [Comment(CommentKind.Block, ##"/* 
//     ccc
// */"##)]
    ]
]
func test_LambdaParam_Init_01(name: String, typeAnnotation: Option<TypeAnnotation>, 
    annotations: Array<Annotation>, comments: Array<Comment>): Unit {
    let LambdaParam = LambdaParam(name, typeAnnotation, annotations: annotations,
     comments: comments)
    println(LambdaParam.toString())
    println()
}
}