/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: SymbolRef_03.cj
// (CJNATIVE and not OHOS and not iOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS and not iOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
class test_01{
    @TestCase
func test_SymbolRef_03() {
    let res = parseFile("./SymbolRef_03.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Expect(sourcefile.toString().contains(##"main() {
    var r: R = foo<T, U>
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr_1: VarDecl = (mainDecl.body.nodes[0] as VarDecl).getOrThrow()
    var expr_2: SymbolRef = (expr_1.initializer.getOrThrow() as SymbolRef).getOrThrow()
    @Expect(expr_2.toString(), ##"foo<T, U>"##)
    @Assert(expr_2.name, "foo")
    @Assert(expr_2.typeArguments.size, 2)
    @Assert(expr_2.typeArguments.toString(), "[T, U]")
}
}