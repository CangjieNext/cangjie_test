/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.9.1
  @Scene: delete
  @Visibility: non public
  @Object: class static func
  @Behavior: delete class static func
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// DEPENDENCE: ../main.cj, ../template.cj
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

// test class: staticmember function
public open class Father {}

public class Son <: Father {}

public class TestClass {
    public static func f1() {
        1
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

    public unsafe static func f13(): Int64 {
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

    public static const func body1() {
        1
    }

    @Frozen
    public static func body2() {
        2
    }
    public static func body3() {
        3
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public unsafe func checker(): Unit {
    assert(TestClass.f1(), 1)
    assert(TestClass.f4(), 3)
    assert(TestClass.f6(), 5)
    assert(TestClass.f7(), 7)
    assert(TestClass.f9(), 9)
    assert(TestClass.f13(), 13)
    assert(TestClass.f14(), 14)
    assert(TestClass.g1<Int64, Int64, Son>(1, 2, Son()), "12")
    assert(TestClass.g2<Int64, String, Son>(1, "a", Son()), "1")
    assert(TestClass.p1(1, b: 2, c: 3), 6)
    assert(TestClass.p2(Son(), b: Son()) is Son, true)
    assert(TestClass.p3(Father(), b: Father()) is Father, true)
    assert(TestClass.body1(), 1)
    assert(TestClass.body2(), 2)
    assert(TestClass.body3(), 3)
}
