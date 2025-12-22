/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: StructDecl_06.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_StructDecl_06() {
    let res = parseFile("./StructDecl_06.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"internal struct s1<T> <: I1 & I2<T> & I3 {
}"##))

    var structDecl: StructDecl = (sourcefile.topLevelDecls[0] as StructDecl).getOrThrow()
    @Expect(structDecl.toString(), ##"internal struct s1<T> <: I1 & I2<T> & I3 {
}"##)
    @Assert(structDecl.body.memberDecls.size, 0)

    @Assert(structDecl.name, "s1")
    @Assert(structDecl.modifiers.size, 1)
    @Assert(structDecl.modifiers[0].toString(), "internal")
    @Assert(structDecl.genericConstraints.isNone())
    @Assert(structDecl.genericParams.size, 1)
    @Assert(structDecl.genericParams[0].toString(), "T")
    @Assert(structDecl.superTyAnnotations.size, 3)
    @Assert(structDecl.superTyAnnotations[0].toString(), "I1")
    @Assert(structDecl.superTyAnnotations[1].toString(), "I2<T>")
    @Assert(structDecl.superTyAnnotations[2].toString(), "I3")
    @Assert(structDecl.annotations.size, 0)
}
