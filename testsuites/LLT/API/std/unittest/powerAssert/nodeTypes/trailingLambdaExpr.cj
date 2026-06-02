/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

func foo(args: Array<Any>, arg!: Bool = false, action!: (Bool) -> Bool) {
    action(arg)
}

@Test
public class TestTrailingLambda {
    /**
     * Checks suitable case in match-case.
     */
    @TestCase
    func case1(): Unit {
        let a = true
        let b = "true"
        @PowerAssert(foo([a, b], arg: false) { a => a }, true)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo([a, b], arg: false) { a => a } == true{/COLOR})`
                    |    |_|| |                    |_| |
                    |    true |                   false|
                    |       |_|                        |
                    |      "true"                      |
                    |__________________________________|
                                    false
     */
}
