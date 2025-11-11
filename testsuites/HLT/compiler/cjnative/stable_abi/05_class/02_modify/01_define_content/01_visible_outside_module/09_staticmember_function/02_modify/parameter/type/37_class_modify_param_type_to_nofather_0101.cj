/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.9.2.37
  @Scene: modify
  @Visibility: public class and public static func
  @Object: class static func
  @Behavior: modify param type to nofather
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
 
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [API/ABI] Changed parameter type of function visible outside the module. The new param type is not a parent type of the old param type.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: staticmember function
open public class Father {}
public class Son <: Father {}

public class TestClass {
    public static func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

    static const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public static const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

    static func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public static func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public static func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }

    public static func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

    static const func p22(a: Son, b: Son): Son {
        b
    }
    public static const func p23(a: Son, b: Son): Son {
        p22(a, b)
    }

    static func p24(a: Son, b: Son): Son {
        b
    }
    @Frozen
    public static func p25(a: Son, b: Son): Son {
        p24(a, b)
    }

    public static func p3(a: Father, b: Father, c: Int64): Father {
        b
    }

    static const func p32(a: Father, b: Father, c: Int64): Father {
        b
    }
    public static const func p33(a: Father, b: Father, c: Int64): Father {
        p32(a, b, c)
    }

    static func p34(a: Father, b: Father, c: Int64): Father {
        b
    }
    @Frozen
    public static func p35(a: Father, b: Father, c: Int64): Father {
        p34(a, b, c)
    }
}

open class baseClass {
    public static func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

    static const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public static const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

    static func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public static func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public static func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }

    public static func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

    static const func p22(a: Son, b: Son): Son {
        b
    }
    public static const func p23(a: Son, b: Son): Son {
        p22(a, b)
    }

    static func p24(a: Son, b: Son): Son {
        b
    }
    @Frozen
    public static func p25(a: Son, b: Son): Son {
        p24(a, b)
    }

    public static func p3(a: Son, b: Father, c: Byte): Father {
        b
    }

    static const func p32(a: Father, b: Father, c: Int64): Father {
        b
    }
    public static const func p33(a: Father, b: Father, c: Int64): Father {
        p32(a, b, c)
    }

    static func p34(a: Father, b: Father, c: Int64): Father {
        b
    }
    @Frozen
    public static func p35(a: Father, b: Father, c: Int64): Father {
        p34(a, b, c)
    }
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    public static func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

    static const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public static const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

    static func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public static func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public static func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }

    public static func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

    static const func p22(a: Son, b: Son): Son {
        b
    }
    public static const func p23(a: Son, b: Son): Son {
        p22(a, b)
    }

    static func p24(a: Son, b: Son): Son {
        b
    }
    @Frozen
    public static func p25(a: Son, b: Son): Son {
        p24(a, b)
    }

    public static func p3(a: Father, b: Father, c: Int64): Father {
        b
    }

    static const func p32(a: Father, b: Father, c: Int64): Father {
        b
    }
    public static const func p33(a: Father, b: Father, c: Int64): Father {
        p32(a, b, c)
    }

    static func p34(a: Father, b: Father, c: Int64): Father {
        b
    }
    @Frozen
    public static func p35(a: Father, b: Father, c: Int64): Father {
        p34(a, b, c)
    }
}

