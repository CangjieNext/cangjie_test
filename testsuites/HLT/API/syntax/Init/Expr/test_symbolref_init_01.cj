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
    name in [
        "A1",
        "_A2"
    ],
    typeArguments in [
        [],
        [AtomicType(BoolType)],
        [AtomicType(BoolType), AtomicType(Int16Type), ParenType(AtomicType(AtomicTypeKind.Int64Type))]
    ],
    comments in [
        [], 
        [Comment(##"/* 
a 
*/"##)],
        [Comment("//1"), Comment("// 2")]
    ]
]
func test_SymbolRef_Init_01(name: String, typeArguments: Array<TypeAnnotation>, comments: Array<Comment>): Unit {
    let SymbolRef = SymbolRef(name, typeArguments, comments: comments)
    println(SymbolRef.toString())
    println()
}
}