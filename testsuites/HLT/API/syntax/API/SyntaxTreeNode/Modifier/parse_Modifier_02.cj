/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: Modifier_02.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_Modifier_02() {
    let res = parseFile("./Modifier_02.cj")
    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"open class C1 <: C2 {
    internal override mut func foo() {}
    private redef static func goo() {}
}"##))

    var decl_1 = (sourcefile.topLevelDecls[0] as ClassDecl).getOrThrow()
    @Assert(decl_1.body.memberDecls[0].modifiers.toString(), "[internal, override, mut]")
    @Assert(decl_1.body.memberDecls[1].modifiers.toString(), "[private, redef, static]")
}
