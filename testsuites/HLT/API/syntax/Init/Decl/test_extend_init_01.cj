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
        Body([]),
        Body([(parseText("static var a = 1").node.getOrThrow() as VarDecl).getOrThrow(),
        (parseText("mut func foo(): ?(Int64, Int64) { None }").node.getOrThrow() as FuncDecl).getOrThrow()])
    ],
    extendedTyAnnotation in [
        CompositeType("C1", [], []),
        CompositeType("C1", [], [CompositeType("T", [], [])])
    ],
    genericConstraints in [
        None,
        GenericConstraints([GenericConstraint(CompositeType("T", [], []), [CompositeType("I1", [], [])])]),
    ],
    genericParams in [
        [],
        (parseText("class A1<T> {}").node.getOrThrow() as ClassDecl).getOrThrow().genericParams,
        (parseText("class A1<T, U> {}").node.getOrThrow() as ClassDecl).getOrThrow().genericParams,
        [GenericParam("T")]
    ],
    superTyAnnotations in [
        [],
        [CompositeType("I1", [], [])],
        [CompositeType("I1", [], []), CompositeType("I2", [], [])]
    ],
    annotations in [
        [],
        [Annotation([Argument(None, false, false, LitConstExpr(LitConstKind.IntergerLiteral, "123"))], "MyAnno", AtOpKind.At)]
    ],
    modifiers in [
        []
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
    ccc
*/"##)]
    ]
]
func test_ExtendDecl_Init_01(body: Body, extendedTyAnnotation: TypeAnnotation, genericConstraints: Option<GenericConstraints>,
        genericParams: Array<GenericParam>, superTyAnnotations: Array<TypeAnnotation>, annotations: Array<Annotation>,
        modifiers: Array<Modifier>, comments: Array<Comment>): Unit {
    let ExtendDecl = ExtendDecl(body, extendedTyAnnotation, genericConstraints, genericParams, superTyAnnotations, annotations: annotations,
        modifiers: modifiers, comments: comments)
    println(ExtendDecl.toString())
    println()
}
