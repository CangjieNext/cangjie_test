macro package define

internal import std.ast.*

public macro M0(input: Tokens) {
    input
}

public macro M1(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M2(input: Tokens): Tokens {
    quote($input
        let x = 1
    )
}

public macro B1(input: Tokens): Tokens {
    return quote(public class C1{
        public var ab =1
        func gg1(x:Int64){}
    })
}

public macro C1(input: Tokens) {
    quote(public open class E <: D {
        public override open func f() { }
    })
}

public macro Letc(input: Tokens) {
    quote(let) + input + quote( = 1;
    $input = 2)
}

public macro Atest(input: Tokens) {
    quote(A.test())
}

public macro Testfoo(input: Tokens) {
    quote(Test().foo)
}

public macro Initfoo(input: Tokens) {
    quote(public init() {
        foo()
        this.coo
    })
}

public macro Addfoo(input: Tokens) {
    quote(public func goo(): Unit {
        foo()
    })
}

public macro Cfunc(input: Tokens) {
    quote(var f = printf)
}

public macro Callg(input: Tokens) {
    quote(let x: Int64 = g())
}

public macro Bf3(input: Tokens) {
    quote(B.f3(Int64(1), Int32(1)))
}

public macro Mutfunc(input: Tokens) {
    quote(var fn = obj.foo)
}

public macro WeakenAccess(input: Tokens) {
    quote(protected override func abc() { })
}

public macro StaticMember(input: Tokens) {
    quote(public redef static func foo(): Int64 {
        return 3
    })
}

public macro ParamName(input: Tokens) {
    quote(public static func f(a: Int32): Int32 { a + 1 })
}

public macro UndeclaredType(input: Tokens) {
    quote(class mc <: mi{})
}

public macro UninitMember(input: Tokens) {
    quote(public var Job:Job)
}

public macro MatchSome(input: Tokens) {
    quote(let x = match (Some(true)) {
        case Some(true) | Some(false) | Some(true) => 0
        case None => 1
    })
}

public macro UnitVariable(input: Tokens) {
    quote(var a: Unit)
}

public macro FooGeneric(input: Tokens) {
    quote(func foo<T>(a:T)  {
        bar<Int64>(1)
        a
    })
}

public macro ShadowInExtend(input: Tokens) {
    quote(
        extend A {
            public func f(): Unit {}
        }
    )
}

public macro protectedInExtend(input: Tokens) {
    quote(
        extend Int64 {
            protected func f1(): Unit {}
        }
        extend A {
            protected func f1(): Unit {}
        }
    )
}

public macro unimplInAbsClass(input: Tokens) {
    quote(
        abstract class A <: I {}
    )
}

public macro overrideSuperExtend(input: Tokens) {
    quote(
        class B <: A {
            public func f(): Unit {}
        }
    )
}

public macro overloadIndexOfImmutable(input: Tokens) {
    quote(
        extend Int64 {
            public operator func [](index: Int64, value!: Bool) { }
        }
        enum A {
            |a(Int64)
            private operator func [](arg1: Int16,arg2: UInt16,arg3: Int8,arg4: UInt8,arg5: Float16,value!: Int64): Unit {}
        }
    )
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

