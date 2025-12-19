/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: WhileExpr_02.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

// 注释暂不支持
@Test
func test_WhileExpr_02() {
    let res = parseFile("./WhileExpr_02.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"main() {
    while (let a <- 1 && a > 0) { // ok
        print(a) // ok
        break
    }
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr_1: WhileExpr = (mainDecl.body.nodes[0] as WhileExpr).getOrThrow()
    @Assert(expr_1.toString(), ##"while (let a <- 1 && a > 0) { // ok
        print(a) // ok
        break
    }"##)
    @Assert(expr_1.body.toString(), ##"{ // ok
        print(a) // ok
        break
    }"##)
    @Assert(expr_1.condition.toString(), ##"let a <- 1 && a > 0"##)
}
