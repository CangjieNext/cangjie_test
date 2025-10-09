/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: IfExpr_02.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_IfExpr_02() {
    let res = parseFile("./IfExpr_02.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"main() {
    if (a) {
        b
    } else {
        c
    }
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr_1: IfExpr = (mainDecl.body.nodes[0] as IfExpr).getOrThrow()
    @Assert(expr_1.toString(), ##"if (a) {
        b
    } else {
        c
    }"##)
    @Assert(expr_1.ifBlock.toString(), ##"{
        b
    }"##)
    @Assert(expr_1.condition.toString(), ##"a"##)
    @Assert(expr_1.elseBlock.isSome())
    @Assert(expr_1.elseBlock.getOrThrow().toString(), ##"{
        c
    }"##)
    @Assert(expr_1.elseIf.isNone())
}
