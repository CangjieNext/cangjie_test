/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: TrailingClosureExpr_02.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_TrailingClosureExpr_02() {
    let res = parseFile("./TrailingClosureExpr_02.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"main() {
    foo<T>{ i * i }
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr_1: TrailingClosureExpr = (mainDecl.body.nodes[0] as TrailingClosureExpr).getOrThrow()
    @Expect(expr_1.toString(), ##"foo<T>{ i * i }"##)
    @Assert(expr_1.arguments.size, 0)
    @Expect(expr_1.callee.toString(), ##"foo<T>"##)
    @Assert(expr_1.trailingLambdaExpr.toString(), ##"{ i * i }"##)
}
