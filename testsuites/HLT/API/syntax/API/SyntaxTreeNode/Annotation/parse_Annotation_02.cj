/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: Annotation_02.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_Annotation_02() {
    let res = parseFile("./Annotation_02.cj")

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"@CallingConv[CDECL] foreign func rand(): Int32
@CallingConv[CDECL]
foreign func rand0(): Int32"##))

    var decl_1: FuncDecl = (sourcefile.topLevelDecls[0] as FuncDecl).getOrThrow()
    @Assert(decl_1.toString(), ##"@CallingConv[CDECL] foreign func rand(): Int32"##)
    let anno_1: Annotation = decl_1.annotations[0]
    @Assert(anno_1.toString(), ##"@CallingConv[CDECL]"##)
    @Assert(anno_1.arguments.toString(), ##"[CDECL]"##)
    @Assert(anno_1.identifier.toString(), ##"CallingConv"##)
}
