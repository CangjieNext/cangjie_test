/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.5.1.1.1
  @Scene: add
  @Visibility: public,used in public @Frozen declare
  @Object: extend instance func
  @Behavior: add instance func
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
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

    public func add_f1() {
        1
    }
    protected func add_f2() {
        2
    }

    private const func add_f3(): Int64 {
        return 3
    }
    public const func add_f4(): Int64 {
        f3()
    }
    internal const func add_pf3(): Int64 {
        return 3
    }
    protected const func add_pf4(): Int64 {
        pf3()
    }

    func add_f5(): Int64 {
        return 5
    }
    @Frozen
    public func add_f6(): Int64 {
        f5()
    }
    func add_pf5(): Int64 {
        return 5
    }
    @Frozen
    protected func add_pf6(): Int64 {
        pf5()
    }

    // 被全局函数调用
    internal func add_f7(): Int64 {
        return 7
    }

    @Deprecated["This API will be deprecated soon"]
    public func add_f8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    public func add_f9() {
        9
    }
    @Deprecated["This API will be deprecated soon"]
    protected func add_pf8() {
        8
    }
    @Deprecated["This API is deprecated", strict: true]
    protected func add_pf9() {
        9
    }

    func add_f10() {
        10
    }
    internal func add_f11() {
        11
    }
    private func add_f12() {
        12
    }

    public unsafe func add_f13(): Int64 {
        return 13
    }
    public const func add_f14(): Int64 {
        14
    }
    public func add_f15(): Int64 {
        return add_f12()
    }

    public func add_g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    public func add_g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    protected func add_pg1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    protected func add_pg2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }

    public func add_p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    public func add_p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public func add_p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
    protected func add_pp1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    protected func add_pp2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    protected func add_pp3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
}

public func global() {
    let s1 = TestStruct()
    s1.f7()
}
public func global_func_01(){
    let ts = TestStruct()
    
    ts.add_f2() == 2
    && ts.add_pf3() == 3
    && ts.add_pf4() == 3
    && ts.add_f5() == 5
    && ts.add_pf5() == 5
    && ts.add_pf6() == 5
    && ts.add_f7() == 7
    && ts.add_pf8() == 8
    && ts.add_f10() == 10
    && ts.add_f11() == 11
    && ts.add_f15() == 12
    && ts.add_pg1("a", "b", Son()) == "ab"
    && ts.add_pg2("a", Son(), Father()) == "a"
    && ts.add_pp1(1, b: 2, c: 3) == 6
    && ts.add_pp2(Son(), b: Son()) is Son 
    && ts.add_pp3(Father(), b: Father()) is Father

    && ts.add_f1() == 1
    && ts.add_f4() == 3
    && ts.add_f6() == 5
    && ts.add_f8() == 8
    && ts.add_f13() == 13
    && ts.add_f14() == 14
    && ts.add_g1("a", "b", Son()) == "ab"
    && ts.add_g2("a", Son(), Father()) == "a"
    && ts.add_p1(1, b: 2, c: 3) == 6
    && ts.add_p2(Son(), b: Son()) is Son && ts.add_p3(Father(), b: Father()) is Father
    && ts.add_p3(Father(), b: Father()) is Father
}
