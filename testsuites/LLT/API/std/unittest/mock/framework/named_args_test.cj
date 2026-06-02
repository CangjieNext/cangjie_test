/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

class NamedArgs {
    func foo(a!: String): Int64 {
        5
    }
    func bar(a!: String = "1"): Int64 {
        5
    }

    func foo(positional: Int64, a!: Int64 = 0, b!: Int64 = 1, c!: Int64 = 1): Int64 {
        5
    }
}

@Test
public class NamedArgsTest {
    private let na = mock<NamedArgs>()

    @TestCase
    func testSingleArg(): Unit {
        success {
            @On(na.foo(a: _)).returns(6)
            @On(na.foo(a: "1")).returns(4)
            @On(na.foo(a: "2")).returns(5)

            assertEquals(na.foo(a: "1"), 4)
            assertEquals(na.foo(a: "2"), 5)
            assertEquals(na.foo(a: "3"), 6)
            assertEquals(na.foo(a: "4"), 6)
        }
    }

    @TestCase
    func testSingleArgWithDefault(): Unit {
        success {
            @On(na.bar()).returns(4)
            @On(na.bar(a: "2")).returns(5)
            assertEquals(na.bar(a: "1"), 4)
            assertEquals(na.bar(a: "2"), 5)
            assertEquals(na.bar(a: "3"), 4)
            assertEquals(na.bar(a: "4"), 4)
        }
    }

    @TestCase
    func testSeveralArgumentWithDefaultValues(): Unit {
        success {
            @On(na.foo(4)).returns(1)
            @On(na.foo(_, b: 0)).returns(2)
            @On(na.foo(_, c: 0)).returns(3)
            @On(na.foo(_, c: _, a: 0)).returns(4)
            @On(na.foo(_, c: 0, a: 0, b: 0)).returns(5)
            assertEquals(na.foo(4, a: 1), 1)
            assertEquals(na.foo(4, a: 1, b: 0), 2)
            assertEquals(na.foo(4, a: 1, c: 0), 3)
            assertEquals(na.foo(4, b: 1, c: 1), 4)
            assertEquals(na.foo(4, b: 0, c: 0), 5)
        }
    }

    @TestCase
    func testCapturingNamedArgs(): Unit {
        success {
            let aCapture = ValueListener<Int64>.new()
            let bCapture = ValueListener<Int64>.new()
            let cCapture = ValueListener<Int64>.new()
            @On(na.foo(4, a: capture(aCapture), b: capture(bCapture), c: capture(cCapture))).returns(1)
            na.foo(4, a: 1)
            na.foo(4, a: 1, b: 0)
            na.foo(4, a: 1, c: 0)
            na.foo(4, b: 1, c: 1)
            na.foo(4, b: 0, c: 0)
            assertEquals(aCapture.allValues(), [1, 1, 1, 0, 0])
            assertEquals(bCapture.allValues(), [1, 0, 1, 1, 0])
            assertEquals(cCapture.allValues(), [1, 1, 0, 1, 0])
        }
    }

    @TestCase
    func testNamedWildCard(): Unit {
        success {
            @On(na.foo(_, a: _, b: _, c: _)).returns(0)
            @On(na.foo(4, a: _, b: _, c: 5)).returns(1)
            @On(na.foo(4, a: _, b: 3, c: _)).returns(2)
            @Assert(na.foo(4, a: 10, b: 3, c: 5), 2)
            @Assert(na.foo(4, a: 10, b: 3, c: 7), 2)
            @Assert(na.foo(4, a: 10, b: 4, c: 5), 1)
            @Assert(na.foo(4, a: 10, b: 4, c: 10), 0)
        }
    }
}
