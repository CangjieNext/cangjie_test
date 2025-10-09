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
  @Behavior: modify non const value
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// (not OHOS)DEPENDENCE: main1.cj, ../../template.cj
// (not OHOS)EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// (not OHOS)EXEC: %compiler %cmp_opt main1.cj %cmp_stable_abi_dylib -o %output
// (not OHOS)RUN-EXEC-1: %run %run_opt %output %run_args
// (not OHOS)EXEC: %rm libstable_abi.*
// (not OHOS)EXEC: %mv test_stable_abi.cjo old.cjo
// (not OHOS)EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// (not OHOS)RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// (not OHOS)EXEC: %compiler %cmp_opt main1.cj %cmp_stable_abi_dylib -o %output
// (not OHOS)RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: staticmember variable
open public class Father {}

public class Son <: Father {}

public class CC {
    public static let a1 = 10
    public static var a2 = 20
    public static const a3 = 3

    static let b1 = 10
    static var b2 = 20
    static const b3 = 3
    protected static let b4 = 40
    internal static var b5 = 50
    private static const b6 = 6
    
    public static let c1: Father = Son()

    static const d1 = 1
    public static const d2 = d1

    static const e1 = 1
    static let e2 = 20
    public static const func e3() {
        e1
    }
    @Frozen
    public func e4() {
        e2
    }
}
