/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: StructDecl_01.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_StructDecl_01() {
    let res = parseFile("./StructDecl_01.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"struct S1 {}"##))

    var structDecl: StructDecl = (sourcefile.topLevelDecls[0] as StructDecl).getOrThrow()
    @Assert(structDecl.toString(), ##"struct S1 {}"##)
    @Assert(structDecl.toTokens().toString(), ##"struct S1 { }"##)
    @Assert(structDecl.getGenericParamsCommasPos().size == 0, true)
    @Assert(structDecl.getGenericParamsLAnglePos().isNone(), true)
    @Assert(structDecl.getGenericParamsRAnglePos().isNone(), true)
    var pos = structDecl.getIdentifierPos()
    @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], [9i32, 8i32, 9i32, 10i32])
    pos = structDecl.getStructKeyWordPos()
    @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], [9i32, 1i32, 9i32, 7i32])
    @Assert(structDecl.getSuperTyAnnotationsBitAndsPos().size == 0, true)
    @Assert(structDecl.getUpperBoundPos().isNone(), true)
}
