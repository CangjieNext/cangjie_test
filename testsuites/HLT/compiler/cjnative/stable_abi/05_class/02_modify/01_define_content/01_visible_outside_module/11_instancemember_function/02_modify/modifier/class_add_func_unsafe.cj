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
  @Visibility: public
  @Object: class instance func
  @Behavior: modifier add unsafe
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: ../../main.cj, ../../template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible
// ASSERT: scan-28 [API/ABI] Added unsafe attribute of instance member functions for classes.
// ASSERT: scan-28 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

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
    public unsafe func f1() {
        1
    }
    protected unsafe func f2() {
        2
    }

    private const unsafe func f3(): Int64 {
        return 3
    }
    public const unsafe func f4(): Int64 {
        f3()
    }
    internal const unsafe func pf3(): Int64 {
        return 3
    }
    protected const unsafe func pf4(): Int64 {
        pf3()
    }

    unsafe func f5(): Int64 {
        return 5
    }
    @Frozen
    public unsafe func f6(): Int64 {
        f5()
    }
    unsafe func pf5(): Int64 {
        return 5
    }
    @Frozen
    protected unsafe func pf6(): Int64 {
        pf5()
    }

    // 被全局函数调用
    internal func f7(): Int64 {
        return 7
    }

    @Deprecated["This API will be deprecated soon"]
    public unsafe func f8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    public unsafe func f9() {
        9
    }
    @Deprecated["This API will be deprecated soon"]
    protected unsafe func pf8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    protected unsafe func pf9() {
        9
    }

    unsafe func f10() {
        10
    }
    internal unsafe func f11() {
        11
    }
    private unsafe func f12() {
        12
    }

    public unsafe func f13(): Int64 {
        return 13
    }
    public unsafe const func f14(): Int64 {
        14
    }

    public unsafe func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    public unsafe func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    protected unsafe func pg1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    protected unsafe func pg2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }

    public unsafe func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    public unsafe func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public unsafe func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
    protected unsafe func pp1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    protected unsafe func pp2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    protected unsafe func pp3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }

    @Version["1.1"]
    public unsafe func ano1() {
        1
    }
    @Version["1.1"]
    protected unsafe func pano1() {
        1
    }
    @Version["1.1"]
    unsafe func ano2() {
        2
    }

    open public unsafe func openfunc() {
        1
    }

    public const init() {}
}

public func global() {
    let v1 = TestClass()
    v1.f7()
}
