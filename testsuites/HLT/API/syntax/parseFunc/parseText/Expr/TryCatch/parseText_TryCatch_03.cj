/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_TryCatch_03() {
    let str = ##"try {
    a
} catch (e: Exception | IOException) {
    b
} catch (_) {
    c
}"##
    let res = parseText(str)
    let sourceNode: SyntaxTreeNode = res.node.getOrThrow()

    var expr: TryCatch = (sourceNode as TryCatch).getOrThrow()
    @Assert(expr.toString(), ##"try {
    a
} catch (e: Exception | IOException) {
    b
} catch (_) {
    c
}"##)
    @Assert(expr.tryBlock.toString(), ##"{
    a
}"##)
    @Assert(expr.catchBlocks.size, 2)
    @Assert(expr.catchBlocks[0].toString(), ##"{
    b
}"##)
    @Assert(expr.catchBlocks[1].toString(), ##"{
    c
}"##)
    @Expect(expr.catchPatterns.size, 2)
    @Assert(expr.catchPatterns[0].toString(), "e: Exception | IOException")
    @Assert(expr.catchPatterns[1].toString(), "_")
    @Assert(expr.finallyBlock.isNone())
    @Assert(expr.resourceSpec.size, 0)
}
