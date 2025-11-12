/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (CJNATIVE and not OHOS) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE and not OHOS) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.syntax.*

@Test
func test_ReturnExpr_02() {
    let str = ##"return if (a) {b} else {b}"##
    let res = parseText(str)
    let sourceNode: SyntaxTreeNode = res.node.getOrThrow()
    var expr_3: ReturnExpr = (sourceNode as ReturnExpr).getOrThrow()

    @Assert(expr_3.toString(), "return if (a) {b} else {b}")
    @Expect(expr_3.retVal.isSome())
    @Expect(expr_3.retVal.getOrThrow().toString(), "if (a) {b} else {b}")
}
