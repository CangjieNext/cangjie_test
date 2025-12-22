/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: VarPattern_01.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_VarPattern_01() {
    let res = parseFile("./VarPattern_01.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"const x_1 = bb"##))

    var _decl: VarDecl = (sourcefile.topLevelDecls[0] as VarDecl).getOrThrow()
    var expr_1: VarPattern = (_decl.pattern as VarPattern).getOrThrow()
    @Expect(expr_1.toString(), "x_1")
    @Assert(expr_1.name, "x_1")
}
