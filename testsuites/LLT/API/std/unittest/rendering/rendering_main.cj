/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

internal import std.unittest.mock.*

class Foo {
    func bar() {}
}

@Test
class A {
    @TestCase
    func f2() {
        let foo = mock<Foo>()
        f(foo)
    }
}

func f(foo: Foo) {
    foo.bar()
}

/* SCAN-IN
    REASON: {COLOR=RED}Unhandled invocation{/COLOR} {COLOR=YELLOW}<?>.bar(){/COLOR} at {COLOR=YELLOW}rendering_main.cj:27{/COLOR}.
        No stubs were specified for method {COLOR=YELLOW}bar{/COLOR}.

Summary: TOTAL: 1
    {COLOR=GREEN}PASSED{/COLOR}: 0, {COLOR=GREEN}SKIPPED{/COLOR}: 0, ERROR: 0
    {COLOR=RED}FAILED{/COLOR}: 1, listed below:
            TCS: {COLOR=YELLOW}A{/COLOR}, CASE: f2
 */
