/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

package unittest.mock.integration

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
import std.collection.ArrayList

class Example {
    func f(_: Int64, _: Int64): String {
        "a"
    }
}

@Test
class IT {
    let mocks: ArrayList<Example> = ArrayList()

    @TestCase
    func t1(): Unit {
        let e = mock<Example>()
        @On(e.f(1, 2)).returns("t1")
        mocks.add(e)
        for (m in mocks) {
            m.f(1, 2)
        }
    }

    @TestCase
    func t2(): Unit {
        let e = mock<Example>()
        @On(e.f(1, 2)).returns("t2")
        mocks.add(e)
        for (m in mocks) {
            m.f(1, 2)
        }
    }
}

/* SCAN-IN
    FAILED: 1, listed below:
 */

/* SCAN-IN
    REASON: Illegal mock object access
    Mock object created in test case t1 is no longer accessible in test case t2.
    Hint: accessing mock objects outside its intended use scope can lead to unstable tests.
 */
