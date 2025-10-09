/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: TryCatch_04.cj
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_TryCatch_04() {
    let res = parseFile("./TryCatch_04.cj")
    var diags = res.diags
    @Assert(diags.size, 0)

    let sourcefile: SourceFile = res.node.getOrThrow()
    @Assert(sourcefile.toString().contains(##"main() {
    try (input = MyResource(),
        output = MyResource()) {
        while (input.hasNextLine()) {
            let lineString = input.readLine()
            output.writeLine(lineString)
        }
    }
}"##))

    var mainDecl: MainDecl = (sourcefile.topLevelDecls[0] as MainDecl).getOrThrow()
    var expr: TryCatch = (mainDecl.body.nodes[0] as TryCatch).getOrThrow()
    @Assert(expr.toString(), ##"try (input = MyResource(),
        output = MyResource()) {
        while (input.hasNextLine()) {
            let lineString = input.readLine()
            output.writeLine(lineString)
        }
    }"##)
    @Assert(expr.tryBlock.toString(), ##"{
        while (input.hasNextLine()) {
            let lineString = input.readLine()
            output.writeLine(lineString)
        }
    }"##)
    @Assert(expr.catchBlocks.size, 0)
    @Expect(expr.catchPatterns.size, 0)
    @Assert(expr.finallyBlock.isNone())
    @Assert(expr.resourceSpec.size, 2)
    @Assert(expr.resourceSpec[0].toString(), "input = MyResource()")
    @Assert(expr.resourceSpec[1].toString(), "output = MyResource()")
}
