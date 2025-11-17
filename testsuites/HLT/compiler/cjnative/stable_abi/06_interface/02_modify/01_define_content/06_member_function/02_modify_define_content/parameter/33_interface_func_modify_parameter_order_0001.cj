/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.6.2.33
  @Scene: modify
  @Visibility: public
  @Object: interface func
  @Behavior: modify function parameter order: named parameter
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Changed named parameter order of function visible outside the module.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]


package test_stable_abi

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }

    public func testOne(a: Int64): Unit {

    }

     public func funcOne(): Int64

     public func funcTwo(a: Int64, b: Int64): Int64 {
            a
     }

      @Frozen
     public func funcThree(a: Int64, b: Int64): Int64 {
            a
     }

     public const func funcFour(a: Int64, b: Int64): Int64 {
            a
     }

     public func funcFive(b!: Int64, a!: Int64): Int16 {
            0
     }
}
