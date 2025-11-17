/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.3.3.1
  @Scene: modify
  @Visibility: public
  @Object: extend static func
  @Behavior: modify static func order
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

// test extend: static function
open public class Father {}
public class Son <: Father {}

public class TestClass {}
public struct TestStruct {}

extend TestClass {
    static func f2() {
        2
    }    
    static func f5(): Int64 {
        return 5
    }
    public static func f1() {
        1
    }

    @Frozen
    public static func f6(): Int64 {
        f5()
    }
    static const func f3(): Int64 {
        return 3
    }
    public static const func f4(): Int64 {
        f3()
    }
    @Deprecated["This API will be deprecated soon"]
    public static func f7() {
        7
    }
    @Deprecated["This API is deprecated", strict: true]
    public static func f8() {
        8
    }


    @Frozen
    public static func f9(): Int64 {
        return 9
    }
    protected static func f10() {
        10
    }
    internal static func f11() {
        11
    }
    private static func f12() {
        12
    }

    public static unsafe func f13(): Int64 {
        return 13
    }
    public static const func f14(): Int64 {
        14
    }
    public static func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    public static func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }


    public static func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    public static func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public static func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
}

extend TestStruct {

    static func f5(): Int64 {
        return 5
    }
    @Frozen
    public static func f6(): Int64 {
        f5()
    }

    static func f2() {
        2
    }

    static const func f3(): Int64 {
        return 3
    }
    public static const func f4(): Int64 {
        f3()
    }

    public static func f1() {
        1
    }
    @Deprecated["This API will be deprecated soon"]
    public static func f7() {
        7
    }
    @Deprecated["This API is deprecated", strict: true]
    public static func f8() {
        8
    }

    @Frozen
    public static func f9(): Int64 {
        return 9
    }

    protected static func f10() {
        10
    }
    internal static func f11() {
        11
    }
    private static func f12() {
        12
    }
    public static func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }
    public static unsafe func f13(): Int64 {
        return 13
    }


    public static func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }

    public static const func f14(): Int64 {
        14
    }
    public static func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c
    }
    public static func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public static func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
}

public func global_func_01(){
    TestClass.f5() == 5
    && TestStruct.f5() == 5
}

