/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.3.2.41
  @Scene: modify
  @Visibility: extend public class and non public/protected static func used in frozen or const declaration
  @Object: extend static func
  @Behavior: modify return type to sub
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible
// ASSERT: scan-3 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-3 [ABI]

package test_stable_abi

// test extend: static function
open public class Father {
    public const init(){}
}
public class Son <: Father {
    public const init(){}
}

interface I{}
public struct B <: I {
    const init(){}
}

public class TestClass {
    public const init() {}
}

extend TestClass {
    public static func f1(a: Int64, b!: Int64=1) {
        1
    }

    static func f2(a: Int64, b!: Int64=1) {
        2
    }

    static const func f3(a: Int64, b!: Int64=1): Int64 {
        return 3
    }
    public static const func f4(): Int64 {
        f3(1)
    }

    static func f5(a: Int64, b!: Int64=1): Int64 {
        return 5
    }
    @Frozen
    public static func f6(): Int64 {
        f5(1)
    }

    static func f7(a: Int64, b!: Int64=1): Int64 {
        return 7
    }
    @Frozen
    protected static func f8(): Int64 {
        f7(1)
    }

    @Frozen
    public static func f9(): Int64 {
        return 9
    }

    protected static func f10(a: Int64, b!: Int64=1) {
        10
    }
    internal static func f11(a: Int64, b!: Int64=1) {
        11
    }
    private static func f12(a: Int64, b!: Int64=1) {
        12
    }

    public static unsafe func f13(): Int64 {
        return 13
    }
    public static const func f14(): Int64 {
        14
    }

    public static func ff1():I {
        B()
    }
    protected static func ff2():I {
        B()
    }
    private static const func ff3():I {
        B()
    }
    internal static const func ff4():I {
        B()
    }
    private static func ff5():I {
        B()
    }
    internal static func ff6():I {
        B()
    }
    public static const func pff3():I {
        ff3();B()
    }
    protected static const func pff4():I {
        ff4();B()
    }

    public static func p1(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        b
    }
    protected static func p2(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        b
    }

    static const func p3(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    public static const func p4(): Son {
        p3(Son(),Father())
    }

    static func p5(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    @Frozen
    public static func p6(): Son {
        p5(Son(),Father())
    }

    static func p7(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    @Frozen
    protected static func p8(): Son {
        p7(Son(),Father())
    }

    internal static func p9(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        d
    }
    private static func p10(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        d
    }

    public static func p11(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        a
    }
    protected static func p12(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        a
    }
    static const func p13(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    public static const func p14(): Son {
        p13(Son(),Father())
    }
    internal static func p15(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    private static func p16(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
}

class privateClass {}

extend privateClass {
    public static func ff1():I {
        B()
    }
    protected static func ff2():I {
        B()
    }
    private static const func ff3():I {
        B()
    }
    internal static const func ff4():I {
        B()
    }
    private static func ff5():I {
        B()
    }
    internal static func ff6():I {
        B()
    }
    public static const func pff3():I {
        ff3();B()
    }
    protected static const func pff4():I {
        ff4();B()
    }

    public static func p1(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        b
    }
    protected static func p2(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        b
    }

    static const func p3(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        d
    }
    public static const func p4(): Father {
        p3(Son(),Father())
    }

    static func p5(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        d
    }
    @Frozen
    public static func p6(): Father {
        p5(Son(),Father())
    }

    static func p7(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    @Frozen
    protected static func p8(): Son {
        p7(Son(),Father())
    }

    internal static func p9(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        d
    }
    private static func p10(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Father {
        d
    }

    public static func p11(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        a
    }
    protected static func p12(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        a
    }
    static const func p13(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    public static const func p14(): Son {
        p13(Son(),Father())
    }
    internal static func p15(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
    private static func p16(a: Son, b: Father, c!: Son = Son(), d!: Father = Father()): Son {
        c
    }
}
