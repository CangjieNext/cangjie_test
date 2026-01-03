/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: IfExpr_04.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
class test_01{
    @TestCase
func test_IfExpr_04() {
    let res = parseFile("./IfExpr_04.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"main() {
    if ((true || true) && let a <- 1) {}
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr_1: IfExpr = (mainDecl.body.nodes[0] as IfExpr).getOrThrow()
    @Assert(expr_1.toString(), ##"if ((true || true) && let a <- 1) {}"##)
    @Assert(expr_1.ifBlock.toString(), ##"{}"##)
    @Assert(expr_1.condition.toString(), ##"(true || true) && let a <- 1"##)
    @Assert(expr_1.elseBlock.isNone())
    @Assert(expr_1.elseIf.isNone())
}
}