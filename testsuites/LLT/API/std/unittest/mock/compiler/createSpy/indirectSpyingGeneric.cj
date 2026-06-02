/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
import std.collection.*

class Foo<K, V> {
    public func bar(x: K, y: V): V {
        77 as V ?? throw Exception()
    }
    public func foo(x: K, y: V): V {
        this.bar(x, y)
    }
    public func boo(x: K, y: V): V {
        this.foo(x, y)
    }

    // Simple implicit current object (missed `this.`)
    public func zoo(x: K, y: V): V {
        88 as V ?? throw Exception()
    }
    public func zar(x: K, y: V): V {
        zoo(x, y)
    }
}

abstract class BarBase<K2, V2> {
    protected func foo(x: K2, y: V2): V2
    func boo(x: K2, y: V2): V2 {
        this.foo(x, y)
    }
}

class BarDerived<K, V> <: BarBase<K, V> {
    public func bar(x: K, y: V): V {
        77 as V ?? throw Exception()
    }
    protected override func foo(x: K, y: V): V {
        this.bar(x, y)
    }
    func zoo(x: K, y: V): V {
        this.boo(x, y)
    }
}

// Complex implicit current object (missed `this.`)
abstract class BarBase2<K, V> {
    protected func foo(x: K, y: V): V
    func boo(x: K, y: V): V {
        this.foo(x, y)
    }
}

class BarDerived2<K, V> <: BarBase2<K, V> {
    public func bar(x: K, y: V): V {
        77 as V ?? throw Exception()
    }
    protected override func foo(x: K, y: V): V {
        this.bar(x, y)
    }

    // In fact, super and implicit super calls go through the mocking framework,
    // need to support super types' members spying
    func zoo(x: K, y: V): V {
        super.boo(x, y)
    }
    func zoo2(x: K, y: V): V {
        boo(x, y)
    }
}

interface BarI<K, V> {
    public func bar(x: K, y: V): V {
        77 as V ?? throw Exception()
    }
    public func foo(x: K, y: V): V {
        this.bar(x, y)
    }
    public func boo(x: K, y: V): V {
        this.foo(x, y)
    }
    public func zoo(x: K, y: V): V {
        this.zoo3(x, y)
    }
    public func zoo2(x: K, y: V): V {
        this.zoo(x, y)
    }
    public func zoo3(x: K, y: V): V {
        88 as V ?? throw Exception()
    }
}

class BarImpl<K, V> <: BarI<K, V> {}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let foo = Foo<String, Int64>()
        let spiedFoo = spy<Foo<String, Int64>>(foo)
        @Assert(spiedFoo.foo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case2(): Unit {
        let foo = Foo<String, Int64>()
        let spiedFoo = spy<Foo<String, Int64>>(foo)
        @Assert(spiedFoo.boo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.boo(_, _)).once())
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case3(): Unit {
        let bar = BarDerived<String, Int64>()
        let spiedBar = spy<BarDerived<String, Int64>>(bar);
        spiedBar.boo("my str", 99)
        Verify.that(@Called(spiedBar.boo(_, _)).once())
    }
    @TestCase
    func case4(): Unit {
        let foo = Foo<String, Int64>()
        let spiedFoo = spy<Foo<String, Int64>>(foo)
        @Assert(spiedFoo.zar("my str", 99), 88)
        Verify.that(@Called(spiedFoo.zar(_, _)).once())
        Verify.that(@Called(spiedFoo.zoo(_, _)).once())
    }
    @TestCase
    func case5(): Unit {
        let bar = BarDerived2<String, Int64>()
        let spiedBar = spy<BarDerived2<String, Int64>>(bar)
        @Assert(spiedBar.zoo("my str", 99), 77)
        Verify.that(@Called(spiedBar.zoo(_, _)).once())
        Verify.that(@Called(spiedBar.foo(_, _)).once())
        Verify.that(@Called(spiedBar.bar(_, _)).once())
    }
    @TestCase
    func case6(): Unit {
        let bar = BarDerived2<String, Int64>()
        let spiedBar = spy<BarDerived2<String, Int64>>(bar)
        @Assert(spiedBar.zoo2("my str", 99), 77)
        Verify.that(@Called(spiedBar.zoo2(_, _)).once())
        Verify.that(@Called(spiedBar.foo(_, _)).once())
        Verify.that(@Called(spiedBar.bar(_, _)).once())
    }

    @TestCase
    func case7(): Unit {
        let foo = BarImpl<String, Int64>()
        let spiedFoo = spy<BarImpl<String, Int64>>(foo)
        @Assert(spiedFoo.foo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case8(): Unit {
        let foo = BarImpl<String, Int64>()
        let spiedFoo = spy<BarImpl<String, Int64>>(foo)
        @Assert(spiedFoo.boo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.boo(_, _)).once())
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case9(): Unit {
        let foo = BarImpl<String, Int64>()
        let spiedFoo = spy<BarImpl<String, Int64>>(foo)
        @Assert(spiedFoo.zoo2("my str", 99), 88)
        Verify.that(@Called(spiedFoo.zoo2(_, _)).once())
        Verify.that(@Called(spiedFoo.zoo(_, _)).once())
        Verify.that(@Called(spiedFoo.zoo3(_, _)).once())
    }
}
