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

@Test[
    accessModifier in [
        None,
        Modifier(ModifierKind.Public)
    ],
    isMacroPkg in [
        true,
        false
    ],
    packageNameIdentifiers in [
       // [],
        ["a", "bb"]
    ],
    comments in [
        [], 
        [Comment(##"/* 
a 
*/"##)],
        [Comment("//1"), Comment("// 2")]
    ]
]
func test_PackageHeader_Init_01(accessModifier: Option<Modifier>, isMacroPkg: Bool, packageNameIdentifiers: Array<String>, comments: Array<Comment>): Unit {
    let PackageHeader = PackageHeader(accessModifier, isMacroPkg, packageNameIdentifiers, comments: comments)
    println(PackageHeader.toString())
    println()
}
