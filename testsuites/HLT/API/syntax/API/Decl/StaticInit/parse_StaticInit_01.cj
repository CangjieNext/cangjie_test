/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: StaticInit_01.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
class test_01{
    @TestCase
func test_StaticInit_01() {
    let res = parseFile("./StaticInit_01.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"class Class_C1 {
    static init() {}
}"##))

    var classDecl: ClassDecl = (sourcefile.topLevelDecls[0] as ClassDecl).getOrThrow()
    var staticInit: StaticInit = (classDecl.body.memberDecls[0] as StaticInit).getOrThrow()

    @Assert(staticInit.toString(), ##"static init() {}"##)
    @Assert(staticInit.toTokens().toString(), ##"static init() { }"##)
    @Assert(staticInit.body.nodes.size, 0)

    var pos = staticInit.getInitKeyWordPos()
    @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], [10i32, 12i32, 10i32, 16i32])
    pos = staticInit.getParamsLParenPos()
    @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], [10i32, 16i32, 10i32, 17i32])
    pos = staticInit.getParamsRParenPos()
    @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], [10i32, 17i32, 10i32, 18i32])
    pos = staticInit.getStaticKeyWordPos()
    @Assert([pos.beginLine, pos.beginColumn, pos.endLine, pos.endColumn], [10i32, 5i32, 10i32, 11i32])
}
}