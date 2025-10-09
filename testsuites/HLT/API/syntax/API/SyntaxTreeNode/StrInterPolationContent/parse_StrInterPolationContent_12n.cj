/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: StrInterPolationContent_12.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_StrInterpolationContent_12() {
    let res = parseFile("./StrInterPolationContent_12.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"var a = "$()""##))

    var varDecl: VarDecl = (sourcefile.topLevelDecls[0] as VarDecl).getOrThrow()
    var expr: LitConstStrExpr = (varDecl.initializer.getOrThrow() as LitConstStrExpr).getOrThrow()
    @Assert(expr.strPartExprs.size, 0)
}
