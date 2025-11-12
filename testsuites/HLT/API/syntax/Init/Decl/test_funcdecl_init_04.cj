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
        None,
        Block([]),
        Block([parseText("a + 1").node.getOrThrow(), parseText("return").node.getOrThrow()])
    ],
    genericConstraints in [
        None,
        GenericConstraints([GenericConstraint(CompositeType("T", [], []), [CompositeType("I1", [], [])])]),
    ],
    kind in [
        FuncKind.Normal
    ],
    name in [
        "foo",
        // "init"
    ],
    genericParams in [
        [],
        (parseText("class A1<T> {}").node.getOrThrow() as ClassDecl).getOrThrow().genericParams,
        (parseText("class A1<T, U> {}").node.getOrThrow() as ClassDecl).getOrThrow().genericParams,
        [GenericParam("T")]
    ],
    params in [
        (parseText("func foo(a: Int64)").node.getOrThrow() as FuncDecl).getOrThrow().params
    ],
    retTyAnnotation in [
        None,
        CompositeType("I1", [], [])
    ],
    annotations in [
        [],
        [Annotation([Argument(None, false, false, LitConstExpr(LitConstKind.IntergerLiteral, "123"))], "MyAnno", AtOpKind.At)]
    ],
    modifiers in [
        [],
        [Modifier(ModifierKind.Public)],
        [Modifier(ModifierKind.Unsafe)]
    ],
    comments in [
        [], 
        [Comment(CommentKind.Block, ##"/* 
    ccc
*/"##)]
    ]
]
func test_FuncDecl_Init_01(body: Option<Block>, genericConstraints: Option<GenericConstraints>, genericParams: Array<GenericParam>,
    kind: FuncKind, name: String, params: ParameterList, retTyAnnotation: Option<TypeAnnotation>, annotations: Array<Annotation>,
    modifiers: Array<Modifier>, comments: Array<Comment>): Unit {
    let FuncDecl = FuncDecl(body, genericConstraints, genericParams, kind, name, params, retTyAnnotation, annotations: annotations,
        modifiers: modifiers, comments: comments)
    println(FuncDecl.toString())
    println()
}