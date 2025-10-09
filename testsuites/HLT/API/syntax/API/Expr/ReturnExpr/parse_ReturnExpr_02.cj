/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ReturnExpr_02.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_ReturnExpr_02() {
    let res = parseFile("./ReturnExpr_02.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"main() {
    return if (a) {b} else {b}
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr_3: ReturnExpr = (mainDecl.body.nodes[0] as ReturnExpr).getOrThrow()
    @Assert(expr_3.toString(), "return if (a) {b} else {b}")
    @Expect(expr_3.retVal.isSome())
    @Expect(expr_3.retVal.getOrThrow().toString(), "if (a) {b} else {b}")
}
