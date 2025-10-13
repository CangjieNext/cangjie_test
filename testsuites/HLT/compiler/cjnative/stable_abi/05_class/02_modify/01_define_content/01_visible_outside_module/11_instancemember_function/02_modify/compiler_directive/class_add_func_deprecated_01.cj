/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.11.2
  @Scene: modify
  @Visibility: public & non public & used in public const declare & used in public @Frozen declare
  @Object: class instance func
  @Behavior: add @Deprecated compiler directive
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: ../../main.cj, ../../template.cj
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

// test class: instancemember function
public open class Father {}

public class Son <: Father {}

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public open class TestClass {
    @Deprecated["This API will be deprecated soon"]
    public func f1() {
        1
    }

    @Deprecated["This API will be deprecated soon"]
    protected func f2() {
        2
    }

    @Deprecated["This API will be deprecated soon"]
    private const func f3(): Int64 {
        return 3
    }

    @Deprecated["This API will be deprecated soon"]
    public const func f4(): Int64 {
        f3()
    }

    @Deprecated["This API will be deprecated soon"]
    internal const func pf3(): Int64 {
        return 3
    }

    @Deprecated["This API will be deprecated soon"]
    protected const func pf4(): Int64 {
        pf3()
    }

    @Deprecated["This API will be deprecated soon"]
    func f5(): Int64 {
        return 5
    }

    @Frozen
    @Deprecated["This API will be deprecated soon"]
    public func f6(): Int64 {
        f5()
    }

    @Deprecated["This API will be deprecated soon"]
    func pf5(): Int64 {
        return 5
    }

    @Frozen
    @Deprecated["This API will be deprecated soon"]
    protected func pf6(): Int64 {
        pf5()
    }

    // 被全局函数调用
    @Deprecated["This API will be deprecated soon"]
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

    @Deprecated["This API will be deprecated soon"]
    func f10() {
        10
    }

    @Deprecated["This API will be deprecated soon"]
    internal func f11() {
        11
    }

    @Deprecated["This API will be deprecated soon"]
    private func f12() {
        12
    }

    @Deprecated["This API will be deprecated soon"]
    public unsafe func f13(): Int64 {
        return 13
    }

    @Deprecated["This API will be deprecated soon"]
    public const func f14(): Int64 {
        14
    }

    @Deprecated["This API will be deprecated soon"]
    public func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }

    @Deprecated["This API will be deprecated soon"]
    public func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }

    @Deprecated["This API will be deprecated soon"]
    protected func pg1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }

    @Deprecated["This API will be deprecated soon"]
    protected func pg2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }

    @Deprecated["This API will be deprecated soon"]
    public func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }

    @Deprecated["This API will be deprecated soon"]
    public func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

    @Deprecated["This API will be deprecated soon"]
    public func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    @Deprecated["This API will be deprecated soon"]
    protected func pp1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }

    @Deprecated["This API will be deprecated soon"]
    protected func pp2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

    @Deprecated["This API will be deprecated soon"]
    protected func pp3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    @Version["1.1"]
    @Deprecated["This API will be deprecated soon"]
    public func ano1() {
        1
    }

    @Deprecated["This API will be deprecated soon"]
    @Version["1.1"]
    protected func pano1() {
        1
    }
    @Version["1.1"]
    @Deprecated["This API will be deprecated soon"]
    func ano2() {
        2
    }

    @Deprecated["This API will be deprecated soon"]
    public open func openfunc() {
        1
    }

    public const init() {}
}

public func global() {
    let v1 = TestClass()
    v1.f7()
}
