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

class Foo {
    public func bar(x: String, y: Int32): Int64 {
        77
    }
    public func foo(x: String, y: Int32): Int64 {
        this.bar(x, y)
    }
    public func boo(x: String, y: Int32): Int64 {
        this.foo(x, y)
    }

    // Simple implicit current object (missed `this.`)
    public func zoo(x: String, y: Int32): Int64 {
        88
    }
    public func zar(x: String, y: Int32): Int64 {
        zoo(x, y)
    }
}

abstract class BarBase {
    protected func foo(x: String, y: Int32): Int64
    func boo(x: String, y: Int32): Int64 {
        this.foo(x, y)
    }
}

class BarDerived <: BarBase {
    public func bar(x: String, y: Int32): Int64 {
        77
    }
    protected override func foo(x: String, y: Int32): Int64 {
        this.bar(x, y)
    }
    func zoo(x: String, y: Int32): Int64 {
        this.boo(x, y)
    }
}

// Complex implicit current object (missed `this.`)
abstract class BarBase2 {
    protected func foo(x: String, y: Int32): Int64
    func boo(x: String, y: Int32): Int64 {
        this.foo(x, y)
    }
}

class BarDerived2 <: BarBase2 {
    public func bar(x: String, y: Int32): Int64 {
        77
    }
    protected override func foo(x: String, y: Int32): Int64 {
        this.bar(x, y)
    }

    // In fact, super and implicit super calls go through the mocking framework,
    // need to support super types' members spying
    func zoo(x: String, y: Int32): Int64 {
        super.boo(x, y)
    }
    func zoo2(x: String, y: Int32): Int64 {
        boo(x, y)
    }
}

interface BarI {
    public func bar(x: String, y: Int32): Int64 {
        77
    }
    public func foo(x: String, y: Int32): Int64 {
        this.bar(x, y)
    }
    public func boo(x: String, y: Int32): Int64 {
        this.foo(x, y)
    }
    public func zoo(x: String, y: Int32): Int64 {
        this.zoo3(x, y)
    }
    public func zoo2(x: String, y: Int32): Int64 {
        this.zoo(x, y)
    }
    public func zoo3(x: String, y: Int32): Int64 {
        88
    }
}

class BarImpl <: BarI {}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let foo = Foo()
        let spiedFoo = spy<Foo>(foo)
        @Assert(spiedFoo.foo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case2(): Unit {
        let foo = Foo()
        let spiedFoo = spy<Foo>(foo)
        @Assert(spiedFoo.boo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.boo(_, _)).once())
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case3(): Unit {
        let bar = BarDerived()
        let spiedBar = spy<BarDerived>(bar)
        spiedBar.boo("my str", 99)
        Verify.that(@Called(spiedBar.boo(_, _)).once())
    }
    @TestCase
    func case4(): Unit {
        let foo = Foo()
        let spiedFoo = spy<Foo>(foo)
        @Assert(spiedFoo.zar("my str", 99), 88)
        Verify.that(@Called(spiedFoo.zar(_, _)).once())
        Verify.that(@Called(spiedFoo.zoo(_, _)).once())
    }
    @TestCase
    func case5(): Unit {
        let bar = BarDerived2()
        let spiedBar = spy<BarDerived2>(bar)
        @Assert(spiedBar.zoo("my str", 99), 77)
        Verify.that(@Called(spiedBar.zoo(_, _)).once())
        Verify.that(@Called(spiedBar.foo(_, _)).once())
        Verify.that(@Called(spiedBar.bar(_, _)).once())
    }
    @TestCase
    func case6(): Unit {
        let bar = BarDerived2()
        let spiedBar = spy<BarDerived2>(bar)
        @Assert(spiedBar.zoo2("my str", 99), 77)
        Verify.that(@Called(spiedBar.zoo2(_, _)).once())
        Verify.that(@Called(spiedBar.foo(_, _)).once())
        Verify.that(@Called(spiedBar.bar(_, _)).once())
    }

    @TestCase
    func case7(): Unit {
        let foo = BarImpl()
        let spiedFoo = spy<BarImpl>(foo)
        @Assert(spiedFoo.foo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case8(): Unit {
        let foo = BarImpl()
        let spiedFoo = spy<BarImpl>(foo)
        @Assert(spiedFoo.boo("my str", 99), 77)
        Verify.that(@Called(spiedFoo.boo(_, _)).once())
        Verify.that(@Called(spiedFoo.foo(_, _)).once())
        Verify.that(@Called(spiedFoo.bar(_, _)).once())
    }
    @TestCase
    func case9(): Unit {
        let foo = BarImpl()
        let spiedFoo = spy<BarImpl>(foo)
        @Assert(spiedFoo.zoo2("my str", 99), 88)
        Verify.that(@Called(spiedFoo.zoo2(_, _)).once())
        Verify.that(@Called(spiedFoo.zoo(_, _)).once())
        Verify.that(@Called(spiedFoo.zoo3(_, _)).once())
    }
}
