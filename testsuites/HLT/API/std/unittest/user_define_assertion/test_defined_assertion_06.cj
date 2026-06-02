/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color

@CustomAssertion
public func checkNotNone<T>(ctx: AssertionCtx, v: ?T): T where T <: ToString {
    if (let Some(res) <- v) {
        return res
    }
    ctx.fail("${ctx.arg("v")} was expected to be Some(_) but got ${v}")
}

@Test
class Test_Defined_Assertion {
    @TestCase
    func test_01(): Unit {
        let e = @Assert[checkNotNone](Option<String>.Some("abc"))
        @Expect(e, "abc")
    }

    @TestCase
    func test_02(): Unit {
        @Expect[checkNotNone](Option<String>.Some("仓颉"))
    }
}
