/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: TrailingClosureExpr_01.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_TrailingClosureExpr_01() {
    let res = parseFile("./TrailingClosureExpr_01.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"main() {
    foo{ i => i * i }
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr_1: TrailingClosureExpr = (mainDecl.body.nodes[0] as TrailingClosureExpr).getOrThrow()
    @Assert(expr_1.toString(), ##"foo{ i => i * i }"##)
    @Assert(expr_1.arguments.size, 0)
    @Assert(expr_1.callee.toString(), ##"foo"##)
    @Assert(expr_1.trailingLambdaExpr.toString(), ##"{ i => i * i }"##)
}
