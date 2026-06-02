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

class PassedBar <: ToString & Equatable<PassedBar> {
    private let x: String
    init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is PassedBar (${x})"
    }
    public operator func ==(x: PassedBar): Bool {
        return this.x == x.x
    }
}

class PassedAnotherBar <: ToString {
    public override func toString() {
        "This is AnotherBar"
    }
}

class ReturnedBar <: ToString & Equatable<ReturnedBar> {
    private let x: String
    init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is ReturnedBar (${x})"
    }
    public operator func ==(x: ReturnedBar): Bool {
        return this.x == x.x
    }
}

class Foo<K, V> {
    public func foo(x: PassedBar): ReturnedBar {
        println("original `foo` was called")
        throw IllegalStateException()
    }
    public func bar(x: K): ReturnedBar {
        println("original `bar` was called")
        throw IllegalStateException()
    }
    public func boo(x: PassedBar): V {
        println("original `boo` was called")
        throw IllegalStateException()
    }
    public func zoo(x: K): V {
        println("original `zoo` was called")
        throw IllegalStateException()
    }
    public func g1<L>(x: Int64): String {
        println("original `g1` was called")
        throw IllegalStateException()
    }
    func g2<L, M>(): Int64 {
        println("original `g2` was called")
        throw IllegalStateException()
    }
}

public func g11<L>(x: Int64): String {
    println("original `g1` was called")
    throw IllegalStateException()
}

func g12<L, M>(): Int64 {
    println("original `g2` was called")
    throw IllegalStateException()
}

@Test
public class Test {
    @TestCase
    func testBasicConfiguration(): Unit {
        let m1 = mock<Foo<String, Int64>>()
        let m2 = mock<Foo<Float64, PassedBar>>()

        @On(m1.foo(_)).returns(ReturnedBar("_1"))
        @On(m1.bar("...")).returns(ReturnedBar("_2"))
        @On(m1.boo(_)).returns(54)
        @On(m1.zoo("...")).returns(55)

        @On(m2.foo(_)).returns(ReturnedBar("_3"))
        @On(m2.bar(0.44)).returns(ReturnedBar("_4"))
        @On(m2.boo(_)).returns(PassedBar("_5"))
        @On(m2.zoo(0.84)).returns(PassedBar("_6"))

        assertEquals(m1.foo(PassedBar("_51")), ReturnedBar("_1"))
        assertEquals(m1.bar("..."), ReturnedBar("_2"))
        assertEquals(m1.boo(PassedBar("_52")), 54)
        assertEquals(m1.zoo("..."), 55)

        assertEquals(m2.foo(PassedBar("_53")), ReturnedBar("_3"))
        assertEquals(m2.bar(0.44), ReturnedBar("_4"))
        assertEquals(m2.boo(PassedBar("_54")), PassedBar("_5"))
        assertEquals(m2.zoo(0.84), PassedBar("_6"))
    }

    @TestCase
    func testDifferentTypeArgs(): Unit {
        let m1 = mock<Foo<String, Int64>>()
        let m2 = mock<Foo<Float64, PassedBar>>()

        @On(m1.g1<Int64>(4)).returns("_1")
        @On(m1.g1<String>(4)).returns("_2")
        @On(m2.g1<Int64>(4)).returns("_3")
        @On(m2.g1<String>(4)).returns("_4")

        assertEquals(m1.g1<String>(4), "_2")
        assertEquals(m1.g1<Int64>(4), "_1")
        assertEquals(m2.g1<Int64>(4), "_3")
        assertEquals(m2.g1<String>(4), "_4")

        @On(m1.g2<Int64, String>()).returns(1)
        @On(m1.g2<String, Int64>()).returns(2)
        @On(m2.g2<Int64, String>()).returns(3)
        @On(m2.g2<String, Int64>()).returns(4)

        assertEquals(m1.g2<Int64, String>(), 1)
        assertEquals(m1.g2<String, Int64>(), 2)
        assertEquals(m2.g2<Int64, String>(), 3)
        assertEquals(m2.g2<String, Int64>(), 4)
    }

    @TestCase
    func testDifferentTypeArgsStatic(): Unit {
        @On(g11<String>(3)).returns("_1")
        @On(g12<String, Int64>()).returns(4)

        assertEquals(g11<String>(3), "_1")
        assertEquals(g12<String, Int64>(), 4)

        assertThrows<IllegalStateException> {
            g11<String>(4)
        }

        assertThrows<IllegalStateException> {
            g11<Int64>(3)
        }

        assertThrows<IllegalStateException> {
            g12<Int64, Int64>()
        }
    }
}
