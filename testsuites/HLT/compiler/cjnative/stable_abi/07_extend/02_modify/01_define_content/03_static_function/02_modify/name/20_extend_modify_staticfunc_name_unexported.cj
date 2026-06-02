/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.4.2.20
  @Scene: modify
  @Visibility: public
  @Object: extend static prop
  @Behavior: modify static func name
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
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
    public static func f1() {
        1
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

    static func f5(): Int64 {
        return 5
    }
    @Frozen
    public static func f6(): Int64 {
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
}

extend TestStruct {
    public static func f1() {
        1
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

    static func f5(): Int64 {
        return 5
    }
    @Frozen
    public static func f6(): Int64 {
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
}

private interface I1 {}
internal interface I2 {}
protected interface I3 {}
public interface I4 {}

extend Int64 <: I1 & I2 {
    public static func foo_1() {
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
    public static func f_1() {}
}
