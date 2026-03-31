/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

// ASSERT: scan-not error

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class A {
    public static var x: Int64 = 10
}

extend A {
    public static func foo() {
        x = 20
    }

    public static func bar(): Int64 {
        x
    }
}


@Test
func test_assign() {
    unsafe {
        @On(A.x = _).doesNothing()

        A.foo()
        @Assert(A.x, 10)
    }
}

@Test
func test_get() {
    unsafe {
        @On(A.x).returns(20)

        @Assert(A.bar(), 20)
    }
}
