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
  @Behavior: add annotations
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
    @Version["1.1"]
    public func f1() {
        1
    }
    @Version["1.1"]
    protected func f2() {
        2
    }
    @Version["1.1"]
    private const func f3(): Int64 {
        return 3
    }
    @Version["1.1"]
    public const func f4(): Int64 {
        f3()
    }
    @Version["1.1"]
    internal const func pf3(): Int64 {
        return 3
    }
    @Version["1.1"]
    protected const func pf4(): Int64 {
        pf3()
    }
    @Version["1.1"]
    func f5(): Int64 {
        return 5
    }
    @Frozen
    @Version["1.1"]
    public func f6(): Int64 {
        f5()
    }
    @Version["1.1"]
    func pf5(): Int64 {
        return 5
    }
    @Frozen
    @Version["1.1"]
    protected func pf6(): Int64 {
        pf5()
    }

    // 被全局函数调用
    @Version["1.1"]
    internal func f7(): Int64 {
        return 7
    }
    @Version["1.1"]
    @Deprecated["This API will be deprecated soon"]
    public func f8() {
        8
    }
    @Version["1.1"]
    @Deprecated["This API is deprecated", strict: true]
    public func f9() {
        9
    }
    @Version["1.1"]
    @Deprecated["This API will be deprecated soon"]
    protected func pf8() {
        8
    }
    @Version["1.1"]
    @Deprecated["This API is deprecated", strict: true]
    protected func pf9() {
        9
    }
    @Version["1.1"]
    func f10() {
        10
    }
    @Version["1.1"]
    internal func f11() {
        11
    }
    @Version["1.1"]
    private func f12() {
        12
    }
    @Version["1.1"]
    public unsafe func f13(): Int64 {
        return 13
    }
    @Version["1.1"]
    public const func f14(): Int64 {
        14
    }
    @Version["1.1"]
    public func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    @Version["1.1"]
    public func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    @Version["1.1"]
    protected func pg1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    @Version["1.1"]
    protected func pg2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    @Version["1.1"]
    public func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    @Version["1.1"]
    public func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    @Version["1.1"]
    public func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
    @Version["1.1"]
    protected func pp1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    @Version["1.1"]
    protected func pp2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    @Version["1.1"]
    protected func pp3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    @Version["1.1"]
    public func ano1() {
        1
    }
    @Version["1.1"]
    protected func pano1() {
        1
    }
    @Version["1.1"]
    func ano2() {
        2
    }
    @Version["1.1"]
    open public func openfunc() {
        1
    }

    public const init() {}
}

public func global() {
    let v1 = TestClass()
    v1.f7()
}
