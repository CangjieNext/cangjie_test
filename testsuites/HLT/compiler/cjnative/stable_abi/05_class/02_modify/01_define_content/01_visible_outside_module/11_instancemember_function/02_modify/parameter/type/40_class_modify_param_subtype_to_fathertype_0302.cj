/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.11.2.40
  @Scene: modify
  @Visibility: non-public class and non-public instance func used in const declare
  @Object: class instance func
  @Behavior: modify param subtype to fathertype
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
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

// test class: instancemember function
open public class Father {}
public class Son <: Father {}

public class TestClass {
    const init() {}

    public  func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

     const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public  const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

     func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public  func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public  func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }

    public  func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

     const func p22(a: Son, b: Son): Son {
        b
    }
    public  const func p23(a: Son, b: Son): Son {
        p22(a, b)
    }

     func p24(a: Son, b: Son): Son {
        b
    }
    @Frozen
    public  func p25(a: Son, b: Son): Son {
        p24(a, b)
    }

    public  func p3(a: Father, b: Father, c: Int64): Father {
        b
    }

     const func p32(a: Father, b: Father, c: Int64): Father {
        b
    }
    public  const func p33(a: Father, b: Father, c: Int64): Father {
        p32(a, b, c)
    }

     func p34(a: Father, b: Father, c: Int64): Father {
        b
    }
    @Frozen
    public  func p35(a: Father, b: Father, c: Int64): Father {
        p34(a, b, c)
    }

    func p4(a: Son, b: Son): Son {
        b
    }
    
    func p5(a: Father, b: Father, c: Int64): Father {
        b
    }
}

open class baseClass {
    const init() {}

    public  func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

     const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public  const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

     func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public  func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public  func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }

    public  func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

     const func p22(a: Son, b: Son): Son {
        b
    }
    public  const func p23(a: Son, b: Son): Son {
        p22(a, b)
    }

     func p24(a: Son, b: Son): Son {
        b
    }
    @Frozen
    public  func p25(a: Son, b: Son): Son {
        p24(a, b)
    }

    public  func p3(a: Father, b: Father, c: Int64): Father {
        b
    }

     const func p32(a: Father, b: Father, c: Int64): Father {
        b
    }
    public  const func p33(a: Father, b: Father, c: Int64): Father {
        p32(a, b, c)
    }

     func p34(a: Father, b: Father, c: Int64): Father {
        b
    }
    @Frozen
    public  func p35(a: Father, b: Father, c: Int64): Father {
        p34(a, b, c)
    }

    func p4(a: Son, b: Son): Son {
        b
    }
    
    func p5(a: Father, b: Father, c: Int64): Father {
        b
    }
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    const init() {}

    public  func f1(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        a + 1
    }

     const func f2(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 2
    }
    public  const func f3(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f2(a, b, c: 1, d: 1)
    }

     func f4(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        return a + 4
    }
    @Frozen
    public  func f5(a: Int64, b: Int64, c!: Int64 = 1, d!: Int64 = 1): Int64 {
        f4(a, b, c: 1, d: 1) + a
    }

    public  func p1(a: Int64, b!: Int64, c!: Int64 = 1, d!: Int64 = 1) {
        a + b + c
    }

    public  func p2(a: Son, b!: Son, c!: Son = Son()): Son {
        c
    }

     const func p22(a: Father, b: Son): Son {
        b
    }
    public  const func p23(a: Father, b: Son): Son {
        p22(a, b)
    }

     func p24(a: Father, b: Son): Son {
        b
    }
    @Frozen
    public  func p25(a: Father, b: Son): Son {
        p24(a, b)
    }

    public  func p3(a: Father, b: Father, c: Int64): Father {
        b
    }

     const func p32(a: Father, b: Father, c: Int64): Father {
        b
    }
    public  const func p33(a: Father, b: Father, c: Int64): Father {
        p32(a, b, c)
    }

     func p34(a: Father, b: Father, c: Int64): Father {
        b
    }
    @Frozen
    public  func p35(a: Father, b: Father, c: Int64): Father {
        p34(a, b, c)
    }

    func p4(a: Son, b: Son): Son {
        b
    }
    
    func p5(a: Father, b: Father, c: Int64): Father {
        b
    }
}
