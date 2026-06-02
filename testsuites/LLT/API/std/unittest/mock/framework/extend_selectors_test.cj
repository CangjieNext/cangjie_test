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

class Model {
    func action(): Int64 {
        0
    }
}

class E <: Exception {}

class Factory {
    private var i: Int = -1

    func next(): Int64 {
        i += 1
        if (i < 3) {
            return i
        }
        throw E()
    }
}

extend MethodActionSelector<Int64> {
    func default(): Unit {
        let factory = Factory()
        (returns {(factory.next() as Int64).getOrThrow()}).atLeastTimes(3)
    }
}

extend<A> CardinalitySelector<A> where A <: ActionSelector {
    func enoughTimes(): Unit {
        times(min: 3, max: 5)
    }
}

extend<A> Continuation<A> where A <: MethodActionSelector<Int64> {
    func thenThrows(): CardinalitySelector<MethodActionSelector<Int64>> {
        then().throws {E()}
    }
}

let m = mock<Model>()

@Test
func testExtendingSelectors(): Unit {
    success {
        @On(m.action()).default()
        @Assert(m.action(), 0)
        @Assert(m.action(), 1)
        @Assert(m.action(), 2)
        assertThrows<E> {
            m.action()
        }
    }

    expectationFailure(["Required: at least 3 times"]) {
        @On(m.action()).default()
        m.action()
    }

    success {
        @On(m.action()).returns(5).enoughTimes()
        m.action()
        m.action()
        m.action()
        m.action()
    }
    success {
        @On(m.action()).returns(5).once().thenThrows()
        @Assert(m.action(), 5)
        assertThrows<E> {
            m.action()
        }
    }
}
