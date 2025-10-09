/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.9.2.36
  @Scene: modify
  @Visibility: public/protected
  @Object: class static func
  @Behavior: modify named parameter order
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

// ASSERT: scan Incompatible!
// ASSERT: scan-2 [ABI] Changed named parameter order of function visible outside the module.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: staticmember function
open public class Father {}
public class Son <: Father {}

public class TestClass {
    public let check = 0

    public static func f1() {
        1
    }

    protected static func f2() {
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

    public func add1(a: Int64, b: Int64): Int64 {
        return a + b
    }

    protected func add2(a: Int64, b: Int64): Int64 {
        return a + b
    }

    public func add3(b!: Int64, a!: Int64): Int64 {
        return a + b
    }

    protected func add4(b!: Int64, a!: Int64): Int64 {
        return a + b
    }

    static const func f7(): Int64 {
        return 7
    }
    public static const func f8(b!: Int64 = 1): Int64 {
        f7() + b
    }

    static func f9(): Int64 {
        return 9
    }
    @Frozen
    public static func f10(b!: Int64 = 1): Int64 {
        f9() + b
    }
}
