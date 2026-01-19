/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: instance function
open public class Father {}
public class Son <: Father {}

public struct TestStruct {
    public const init() {}
}
extend TestStruct {
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
    public func f15() {
        f12()
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

    public func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    public func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
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
}

public func global() {
    let s1 = TestStruct()
    s1.f7()
}
public func global_func_01() {
    let s1 = TestStruct()
    
    s1.f2() == 2
    && s1.pf3() == 3
    && s1.pf4() == 3
    && s1.pf5() == 5
    && s1.pf6() == 5
    && s1.pf8() == 8
    && s1.f10() == 10
    && s1.f11() == 11
    && s1.f15() == 12
    && s1.pg1("a", "b", Son()) == "ab"
    && s1.pg2("a", Son(), Father()) == "a"
    && s1.pp1(1, b: 2, c: 3) == 6
    && s1.pp2(Son(), b: Son()) is Son && s1.pp3(Father(), b: Father()) is Father
    && s1.pp3(Father(), b: Father()) is Father
}
