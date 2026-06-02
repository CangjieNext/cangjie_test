/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// SEPARATE-FILE: other.cj
// EXEC-0: %compiler %cmp_opt %compile_lib_opt --mock=on -Woff=all other.cj -o libother.%middle
package other

public var foo: Int32 = 10

// SEPARATE-FILE: test.cj
// EXEC: %compiler %cmp_opt -Woff=all test.cj libother.%middle -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-not error

package default

import other

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class MyException <: Exception {}

@Test
func test() {
    @On(other.foo = _).throws(MyException())
    @On(other.foo).returns(42)

    @AssertThrows[MyException](other.foo = 10)
    @Assert(other.foo, 42)
}

@Test
func test_no_mock() {
    @Assert(other.foo, 10)
    other.foo = 42
    @Assert(other.foo, 42)
}
