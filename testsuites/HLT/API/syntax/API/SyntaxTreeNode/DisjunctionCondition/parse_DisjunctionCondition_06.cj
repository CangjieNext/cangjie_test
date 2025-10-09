/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: DisjunctionCondition_06.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_DisjunctionCondition_06() {
    let res = parseFile("./DisjunctionCondition_06.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"main() {
    if (!(a > 1) && b > 2 || c > 3 && c > 4 || (d > 5 || let a <- 1 && true)) {}
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr: IfExpr = (mainDecl.body.nodes[0] as IfExpr).getOrThrow()

    let condition = expr.condition

    @Assert(condition.toString(), ##"!(a > 1) && b > 2 || c > 3 && c > 4 || (d > 5 || let a <- 1 && true)"##)
    @Expect(condition.cond.size, 3)
    @Assert(condition.cond[0].toString(), ##"!(a > 1) && b > 2"##)
    @Assert(condition.cond[1].toString(), ##"c > 3 && c > 4"##)
    @Assert(condition.cond[2].toString(), ##"(d > 5 || let a <- 1 && true)"##)
}
