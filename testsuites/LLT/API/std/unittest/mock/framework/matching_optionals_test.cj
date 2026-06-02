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
import std.collection.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

class A {
    func anyOpt(a: Option<Any>): Int64 {
        3
    }
    func intOpt(a: Option<Int64>): Int64 {
        3
    }
    func anyOptOpt(a: Option<Option<Any>>): Int64 {
        3
    }
    func intOptOptOptOpt(a: Option<Option<Option<Option<Int64>>>>): Int64 {
        3
    }
    func iOpt(a: Option<I>): Int64 {
        3
    }
}

interface I {}

class X <: I {}

class Y <: I {}

let a = mock<A>()

@Test
func testMatchingOptionals(): Unit {
    success {
        @On(a.intOpt(_)).returns(-1)
        @On(a.intOpt(eq(Some(3)))).returns(0)
        @Assert(a.intOpt(Some(3)), 0)
        @Assert(a.intOpt(3), 0)
        @On(a.intOpt(eq(1))).returns(1)
        @Assert(a.intOpt(1), 1)
        @Assert(a.intOpt(None), -1)
        @Assert(a.intOpt(5), -1)
    }
    success {
        @On(a.anyOpt(3)).returns(0)
        @On(a.anyOpt("str")).returns(1)
        @On(a.anyOpt(3.0)).returns(2)
        @Assert(a.anyOpt(3), 0)
        @Assert(a.anyOpt("str"), 1)
        @Assert(a.anyOpt(3.0), 2)
    }
    success {
        @On(a.iOpt(_)).returns(-1)
        let x = X()
        @On(a.iOpt(x)).returns(1)
        @Assert(a.iOpt(x), 1)
        @Assert(a.iOpt(X()), -1)
        @Assert(a.iOpt(Y()), -1)
    }

    success {
        @On(a.anyOptOpt(3)).returns(0)
        @Assert(a.anyOptOpt(3), 0)
        @On(a.anyOptOpt(eq("s"))).returns(1)
        @Assert(a.anyOptOpt("s"), 1)
    }

    success {
        @On(a.intOptOptOptOpt(_)).returns(-1)
        @On(a.intOptOptOptOpt(3)).returns(0)
        @Assert(a.intOptOptOptOpt(3), 0)
        @On(a.intOptOptOptOpt(eq(Some(4)))).returns(1)
        @Assert(a.intOptOptOptOpt(4), 1)
        @On(a.intOptOptOptOpt(eq(Some(Some(Some(5)))))).returns(2)
        @Assert(a.intOptOptOptOpt(5), 2)
        @On(a.intOptOptOptOpt(eq<Option<Option<Option<Int>>>>(Some(Some(None))))).returns(3)
        @Assert(a.intOptOptOptOpt(Some(Some(None))), -1)
        @Assert(a.intOptOptOptOpt(Some(Some(Some(None)))), 3)
        @On(a.intOptOptOptOpt(eq<Option<Option<Int>>>(Some(None)))).returns(4)
        @Assert(a.intOptOptOptOpt(Option<Int64>.None), 4)
        @Assert(a.intOptOptOptOpt(Option<Option<Option<Int64>>>.None), -1)
        @Assert(a.intOptOptOptOpt(Some(None)), -1)
        @On(a.intOptOptOptOpt(eq(Option<Option<Int64>>.None))).returns(5)
        @Assert(a.intOptOptOptOpt(Option<Option<Int64>>.None), 5)
    }
}

let b = mock<A>()

@Test
func testCapturingOptionals(): Unit {
    let stringListener = ValueListener<String>.new()
    let intListener = ValueListener<Int64>.new()
    let intOptListener = ValueListener<Option<Int64>>.new()
    success {
        @On(b.anyOpt(_)).returns(-1)
        @On(b.anyOpt(capture(stringListener))).returns(0)
        @Assert(b.anyOpt("f"), 0)
        @Assert(stringListener.lastValue(), "f")
        @Assert(b.anyOpt(3), -1)
        @Assert(stringListener.lastValue(), "f")
        @Assert(b.anyOpt("g"), 0)
        @Assert(stringListener.lastValue(), "g")
        @Assert(stringListener.allValues(), ["f", "g"])
    }
    success {
        @On(b.intOptOptOptOpt(_)).returns(-1)
        @On(b.intOptOptOptOpt(capture(intListener))).returns(0)
        @Assert(b.intOptOptOptOpt(3), 0)
        @Assert(intListener.lastValue(), 3)
        @Assert(b.intOptOptOptOpt(4), 0)
        @Assert(intListener.lastValue(), 4)
        @Assert(b.intOptOptOptOpt(None), -1)
        @Assert(intListener.allValues(), [3, 4])
    }
    success {
        @On(b.intOptOptOptOpt(_)).returns(-1)
        @On(b.intOptOptOptOpt(capture(intOptListener))).returns(0)

        @Assert(b.intOptOptOptOpt(3), 0)
        @Assert(intOptListener.lastValue() == Some(3))

        @Assert(b.intOptOptOptOpt(4), 0)
        @Assert(intOptListener.lastValue() == Some(4))

        @Assert(b.intOptOptOptOpt(None), -1)
        @Assert(intOptListener.lastValue() == Some(4))

        @Assert(b.intOptOptOptOpt(Some(Some(Some(None)))), 0)
        @Assert(intOptListener.lastValue() == Some(None))

        @Assert(b.intOptOptOptOpt(Some(None)), -1)
        @Assert(intOptListener.allValues().size, 3)
    }
}
