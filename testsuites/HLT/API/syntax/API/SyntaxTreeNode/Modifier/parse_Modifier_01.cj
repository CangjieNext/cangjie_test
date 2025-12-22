/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: Modifier_01.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_Modifier_01() {
    let res = parseFile("./Modifier_01.cj")
    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"open public sealed class C1 {}"##))

    var decl_1 = (sourcefile.topLevelDecls[0] as ClassDecl).getOrThrow()
    @Assert(decl_1.modifiers.toString(), "[open, public, sealed]")
    match (decl_1.modifiers[2].kind) {
        case Sealed => ()
        case _ => @Assert(false)
    }
}
