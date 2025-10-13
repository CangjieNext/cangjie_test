/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class A {
    A(y: Int64) {}

    func g() {
        println("g")
    }
}

@Test
class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let y = unsafe { createMock<A>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default1A10g$ToMock_AHv",
            [],
            ()
        )
        let z = h<A>()
        z.g()
        y.g()
    }
}

@Frozen
func h<T>() {
    unsafe { createMock<T>(dummyMockingCallHandler) }
}

/* SCAN-IN
Actual call: g()
Declared method: g()[NA, D, AC, NA, primaryConstructor.cj:20:10]: Unit
Declared function name: g -> _CN7default1A10g$ToMock_AHv
Outer decl name: A -> _CN7default1AE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: g()
Declared method: g()[NA, D, AC, NA, primaryConstructor.cj:20:10]: Unit
Declared function name: g -> _CN7default1A10g$ToMock_AHv
Outer decl name: A -> _CN7default1AE
Receiver: [doesn't implement ToString]
------------------------------
 */
