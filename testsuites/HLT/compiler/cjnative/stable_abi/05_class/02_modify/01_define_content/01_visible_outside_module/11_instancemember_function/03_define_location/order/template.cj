/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: instancemember function
open public class Father {}
public class Son <: Father {}

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

open public class TestClass {
    public open func f1() {
        1
    }
    protected open func f2() {
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
    public open func f6(): Int64 {
        f5()
    }
    func pf5(): Int64 {
        return 5
    }
    @Frozen
    protected open func pf6(): Int64 {
        pf5()
    }

    // 被全局函数调用
    internal func f7(): Int64 {
        return 7
    }

    @Deprecated["This API will be deprecated soon"]
    public open func f8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    public open func f9() {
        9
    }
    @Deprecated["This API will be deprecated soon"]
    protected open func pf8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    protected open func pf9() {
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

    public unsafe open func f13(): Int64 {
        return 13
    }
    public const func f14(): Int64 {
        14
    }

    public open func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    public open func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    protected open func pg1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    protected open func pg2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
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

    @Version["1.1"]
    public open func ano1() {
        1
    }
    @Version["1.1"]
    protected open func pano1() {
        1
    }
    @Version["1.1"]
    func ano2() {
        2
    }

    public open func openfunc() {
        1
    }

    public open func _openfunc() {
        1
    }

    public const init() {}
}

public func global() {
    let v1 = TestClass()
    v1.f7()
}


