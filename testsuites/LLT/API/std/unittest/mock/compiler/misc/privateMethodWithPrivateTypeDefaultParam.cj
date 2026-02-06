/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// SEPARATE-FILE: other.cj
// EXEC-0: %compiler %cmp_opt %compile_lib_opt --mock=on -Woff=all other.cj -o libother.%middle
package other

private enum E {
    | A | B
}

public class A {
    private func foo(e!: E = E.A): String {
        "original"
    }

    public func callFoo(otherA: A): String {
        otherA.foo() 
    }
}

// SEPARATE-FILE: test.cj
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle test.cj libother.%middle -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
package default

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

import other.*

@Test
func test(): Unit {
    let a = unsafe { createMock<A>(dummyMockingCallHandler) }

    try {
        A().callFoo(a)        
    } catch (e: Exception) {
        println(e)
    }
}

/* SCAN-IN
NoMockMatchersFoundException: There are no any matchers for method _CN5other1A20foo(Enum-E)$ToMock_AHCNat3AnyE
*/
