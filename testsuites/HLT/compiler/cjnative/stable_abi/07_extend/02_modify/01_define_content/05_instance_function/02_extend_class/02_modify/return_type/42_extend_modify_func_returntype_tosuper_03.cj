/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.5.1.2.42
  @Scene: modify
  @Visibility: non public/protected instance func
  @Object: extend instance func
  @Behavior: modify func return type to super
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test extend: instance function
interface I{}
open public class Father {
    public const init(){}
}
public class Son <: Father & I{
    public const init(){}
}
interface I2 <: I {}
public struct B <: I {
    const init(){}
}
open public class TestClass {
    public const init() {}
}
extend TestClass {
    public func f1() {
        1
    }
    protected func f2() {
        2
    }

    private const func f3(): Int64 {
        return 3
    }
    public const func f4(): Int64 {
        f3()
    }
    internal const func pf3(): Int64 {
        return 3
    }
    protected const func pf4(): Int64 {
        pf3()
    }

    func f5(): Int64 {
        return 5
    }
    @Frozen
    public func f6(): Int64 {
        f5()
    }
    func pf5(): Int64 {
        return 5
    }
    @Frozen
    protected func pf6(): Int64 {
        pf5()
    }

    // 被全局函数调用
    internal func f7(): Int64 {
        return 7
    }

    @Deprecated["This API will be deprecated soon"]
    public func f8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    public func f9() {
        9
    }
    @Deprecated["This API will be deprecated soon"]
    protected func pf8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    protected func pf9() {
        9
    }

    func f10() {
        10
    }
    internal func f11() {
        11
    }
    private func f12() {
        12
    }

    public unsafe func f13(): Int64 {
        return 13
    }
    public const func f14(): Int64 {
        14
    }

    public func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    public func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    protected func pg1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    protected func pg2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }

    public func ff1():I {
        B()
    }
    protected func ff2():I {
        B()
    }
    private const func ff3():I {
        B()
    }
    internal const func ff4():I {
        B()
    }
    private func ff5():I {
        B()
    }
    internal func ff6():I {
        B()
    }
    public const func pff3():I {
        ff3();B()
    }
    protected const func pff4():I {
        ff4();B()
    }

    public func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    public func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
    private const func p4(a: Son, b!: Son, c!: Son = Son()): Father {
        c
    }
    internal const func p5(a: Father, b!: Father, c!: Father = Father()): Father {
        Son()
    }
    private func p6(a: Son, b!: Son, c!: Son = Son()): Father {
        c
    }
    internal func p7(a: Father, b!: Father, c!: Father = Father()): Father {
        Son()
    }
    private func p8(a: Son, b!: Son, c!: Son = Son()): Father {
        c
    }
    internal func p9(a: Father, b!: Father, c!: Father = Father()): Father {
        Son()
    }
    private const func p10(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    internal const func p11(a: Father, b!: Father, c!: Father = Father()): Son {
        Son()
    }
    protected func pp1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    protected func pp2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    protected func pp3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    public const func pp4(a: Son, b!: Son, c!: Son = Son()): Son {
        p4(a,b:b,c:c);p10(a,b:b,c:c)
        c
    }
    protected const func pp5(a: Father, b!: Father, c!: Father = Father()): Father {
        p5(a,b:b,c:c);p11(a,b:b,c:c)
        c
    }
}

public func global() {
    let v1 = TestClass()
    v1.f7()
}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(TestClass().pp3(Father(), b: Father()) is Father, true)
    assert(TestClass().p5(Father(), b: Father()) is Father, true)
    assert(TestClass().p7(Father(), b: Father()) is Father, true)
    assert(TestClass().ff1() is I, true)
    assert(TestClass().ff2() is I, true)
    assert(TestClass().ff4() is I, true)
    assert(TestClass().ff6() is I, true)
    assert(TestClass().pp2(Son(), b: Son()) is Son, true)
    assert(TestClass().p11(Father(), b: Father()) is Father, true)
    assert(TestClass().p9(Father(), b: Father()) is Father, true)
}
