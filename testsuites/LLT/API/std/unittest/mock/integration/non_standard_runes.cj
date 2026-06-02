/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-not exception

package unittest.mock.integration

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class M {
    func hello(s: String): String {
        "a"
    }
}

@Test
func test(): Unit {
    let m = mock<M>()
    @On(m.hello("你好")).returns("t1")
}

/* SCAN-IN
    FAILED: 1, listed below:
 */

/* SCAN-IN
REASON: Expectation failed
 */

/* SCAN-IN
Too few invocations for stub m.hello(
 */
