/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.3.2.42
  @Scene: modify
  @Visibility: public
  @Object: extend instance func
  @Behavior: modify const frozen func body
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-6 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-6 [ABI]
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
    public static func f1() {
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        1 ** 1
    }

    static func f2() {
        2
    }

    static const func f3(): Int64 {
        try {
        } catch (_) {}
        return 3
    }
    public static const func f4(): Int64 {
        try {
        } catch (_) {}
        f3()
    }

    static func f5(): Int64 {
        try {
            throw Exception()
        } catch (_) {}
        return 5
    }
    @Frozen
    public static func f6(): Int64 {
        try {
            throw Exception()
        } catch (_) {}
        f5()
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
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        10
    }
    internal static func f11() {
        11
    }
    private static func f12() {
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        12
    }

    public static unsafe func f13(): Int64 {
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        return 13
    }
    public static const func f14(): Int64 {
        14
    }

    public static func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    public static func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
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
    public static func f15(): Int64 {
        return f12()
    }
}

extend TestStruct {
    public static func f1() {
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        1
    }

    static func f2() {
        2
    }

    static const func f3(): Int64 {
        try {
        } catch (_) {}
        return 3
    }
    public static const func f4(): Int64 {
        try {
        } catch (_) {}
        f3()
    }

    static func f5(): Int64 {
        try {
            throw Exception()
        } catch (_) {}
        return 5
    }
    @Frozen
    public static func f6(): Int64 {
        try {
            throw Exception()
        } catch (_) {}
        f5()
    }

    @Deprecated["This API will be deprecated soon"]
    public static func f7() {
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
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
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        10
    }
    internal static func f11() {
        111
    }
    private static func f12() {
        121
    }

    public static unsafe func f13(): Int64 {
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        return 13
    }
    public static const func f14(): Int64 {
        14
    }

    public static func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        try {
            throw Exception()
        } catch (_) {}
        if (true) {1} else {2}
        a.toString() + b.toString()
    }
    public static func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }

    public static func p1(a: Int64, b!: Int64, c!: Int64 = 1) {
        a + b + c - 0
    }
    public static func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }
    public static func p3(a: Father, b!: Father, c!: Father = Father()): Father {
        c
    }
}

private interface I1 {}
internal interface I2 {}
protected interface I3 {}
public interface I4 {}

extend Int64 <: I1 & I2 {
    public static func foo1() {
        1
    }
}

extend Int64 {
    public static func foo2() {
        2
    }
}

public class Foo<T> {}

extend<T> Foo<T> where T <: I1 {
    public static func f1() {}
}

public func global_func_01(){
    TestClass.f2() == 2
    && TestClass.f10() != 0
    && TestClass.f11() != 0
    && TestStruct.f2() != 0
    && TestStruct.f11() != 0
    && TestClass.f15() != 0
}