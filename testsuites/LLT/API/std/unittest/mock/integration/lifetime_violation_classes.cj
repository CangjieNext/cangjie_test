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

let mocks: ArrayList<Example> = ArrayList()

@Test
class IT1 {
    protected override func beforeAll(): Unit {
        let global = mock<Example>()
        @On(global.f(1, 2)).returns("global")
        mocks.add(global)
    }

    @TestCase
    func t1(): Unit {
        for (m in mocks) {
            m.f(1, 2)
        }
    }
}

@Test
class IT2 {
    @TestCase
    func t2(): Unit {
        for (m in mocks) {
            m.f(1, 2)
        }
    }
}

/* SCAN-IN
    FAILED: 1, listed below:
            TCS: IT2, CASE: t2
 */

/* SCAN-IN
    REASON: Illegal mock object access
    Mock object created in initializer of class IT1 is no longer accessible in test case t2.
    Hint: accessing mock objects outside its intended use scope can lead to unstable tests.
 */
