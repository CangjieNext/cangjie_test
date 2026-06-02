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

public class Overloads {
    public func foo(s: String): String {
        return ""
    }

    public func foo(i: Int64): String {
        return ""
    }

    public func foo(i: Int64, j: Int64): String {
        return ""
    }

    public func foo(i: Int64, j: Int64, s: String): String {
        return ""
    }

    public func foo(i: Int64, j: Int64, k: Int64): String {
        return ""
    }
}

@Test
public class StubOverloadsTest {
    private let o = mock<Overloads>()

    @TestCase
    func testOverloads(): Unit {
        success {
            // verify this compiles and stubs register without issues
            @On(o.foo("")).returns("a").anyTimes()
            @On(o.foo(3)).returns("a").anyTimes()
            @On(o.foo(ofType<String>())).returns("a").anyTimes()
            @On(o.foo(ofType<Int64>())).returns("a").anyTimes()
            @On(o.foo(_, _)).returns("a").anyTimes()
            @On(o.foo(_, _, 5)).returns("a").anyTimes()
            @On(o.foo(_, _, ofType<Int64>())).returns("a").anyTimes()
            @On(o.foo(_, _, ofType<String>())).returns("a").anyTimes()
            @On(o.foo(_, _, "")).returns("a").anyTimes()

            // this doesn't btw
            // @On(o.foo(_)).returns("a").anyTimes()
        }
    }
}
