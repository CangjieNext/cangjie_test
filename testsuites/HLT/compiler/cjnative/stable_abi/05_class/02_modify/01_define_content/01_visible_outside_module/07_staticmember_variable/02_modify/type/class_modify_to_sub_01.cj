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
  @Visibility: public & non public
  @Object: class static var
  @Behavior: class staticmember variable from type A to subtype B
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template1.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template1.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
 
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [API/ABI] Modified static variables' type for class visible outside the module. The new type is not a subtype of the old type.
// ASSERT: scan-2 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: staticmember variable
open public class Father {}

public class Son <: Father {}

public class CC {
    public static let a1: Any = 1
    public static var a2: Any = 2
    public static const a3: Int64 = 3

    public static let c1: Son = Son()
    protected static let c2: Father = Father()
    internal static const c3: Byte = 1
    private static var c4: Any = 1
}
