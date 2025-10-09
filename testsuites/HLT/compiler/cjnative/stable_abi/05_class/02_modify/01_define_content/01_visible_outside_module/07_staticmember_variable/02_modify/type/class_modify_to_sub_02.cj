/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.7.2
  @Scene: modify
  @Visibility: public
  @Object: class static var
  @Behavior: class staticmember variable from type A to subtype B
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template1.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template1.cj -o libstable_abi.%dylib_suffix
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

// test class: staticmember variable
open public class Father {}

public class Son <: Father {}

public class CC {
    public static let a1: Int64 = 1
    public static var a2: Int64 = 2
    public static const a3: Int64 = 3

    public static let c1: Father = Father()
    protected static let c2: Son = Son()
    internal static const c3: Int64 = 1
    private static var c4: Int64 = 1
}

