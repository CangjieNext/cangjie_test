/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./%n
// EXEC: %compiler %cmp_opt -p %n --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

/* SCAN-IN
    Summary: TOTAL: 1
    PASSED: 1, SKIPPED: 0, ERROR: 0
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
import export_custom_matchers.*

class Example {
    func foo(args: Array<Int64>): Int64 {
        return 0
    }
}

@Test
class TestExample {
    @TestCase
    public func example(): Unit {
        let e = mock<Example>()
        @On(e.foo(arrayContains(5))).returns(0)
        @On(e.foo(arrayContains(2))).returns(1)
        @On(e.foo(arrayContains(0))).returns(2)
        @Assert(e.foo([0, 1, 2]), 2)
        @Assert(e.foo([1, 2, 3]), 1)
        @Assert(e.foo([0, 0, 5]), 2)
        @Assert(e.foo([1, 1, 5]), 0)
        @Assert(e.foo(3, 5, 3), 0)
    }
}
