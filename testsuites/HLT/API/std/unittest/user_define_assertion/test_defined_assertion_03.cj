/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan Codeblock: { => } did not raise specified expection

@CustomAssertion
public func doesThrow<E>(ctx: AssertionCtx, codeblock: () -> Any): E where E <: Exception {
    try {
        codeblock()
    } catch (e: E) {
        return e
    }
    ctx.fail("Codeblock: ${ctx.arg("codeblock")} did not raise specified expection")
}

@Test
class Test_Defined_Assertion {
    @TestCase
    func test_01(): Unit {
        let e = @Expect[doesThrow<NoneValueException>]({ => })
        @Expect(e.toString(), "NoneValueException")
    }
}
