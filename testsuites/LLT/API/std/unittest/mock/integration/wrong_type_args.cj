/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

package unittest.mock.integration

internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class Example {
    func f<T, A>() {
        "1"
    }
}

@Test
class IT {
    @TestCase
    func t1(): Unit {
        let m = mock<Example>()
        @On(m.f<Int64, String>()).returns("2")

        @Assert(m.f<String, Int64>(), "2")
    }
}

// The mock framework error can be improved here to point to the different type arguments specifically,
// not to whole stub mismatch

/* SCAN-IN
    REASON: Unhandled invocation <?>.f() at wrong_type_args.cj:31.
        No stubs were specified for method f.
 */
