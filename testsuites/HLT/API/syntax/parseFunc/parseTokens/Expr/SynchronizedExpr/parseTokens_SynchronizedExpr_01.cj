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
class test_01{
    @TestCase
func test_SynchronizedExpr_01() {
    let _quote_1 = quote(synchronized(m) {
    })
    let res_1 = parseTokens(_quote_1)

    let _quote_2 = quote(synchronized(m) {
        foo()
    })
    let res_2 = parseTokens(_quote_2)

    var expr_1: SynchronizedExpr = (res_1.node.getOrThrow() as SynchronizedExpr).getOrThrow()

    @Assert(expr_1.toString(), ##"synchronized(m) {
}"##)
    @Assert(expr_1.block.toString(), ##"{
}"##)
    @Assert(expr_1.structuredMutex.toString(), "m")

    var expr_2: SynchronizedExpr = (res_2.node.getOrThrow() as SynchronizedExpr).getOrThrow()
    @Assert(expr_2.toString(), ##"synchronized(m) {
    foo()
}"##)
    @Assert(expr_2.block.toString(), ##"{
    foo()
}"##)
    @Assert(expr_2.structuredMutex.toString(), "m")

}
}