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
  @Behavior: modify name of class staticmember variable
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: ../../main.cj, ../../template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-3 [API/ABI] Class public static member variable visible outside the module deleted or made private.
// ASSERT: scan-3 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: staticmember variable
public open class Father {}

public class Son <: Father {}

public class CC {
    public static let _a1 = 1
    public static var _a2 = 2
    public static const _a3 = 3

    static let b1 = 1
    static var b2 = 2
    static const b3 = 3
    protected static let b4 = 4
    internal static var b5 = 5
    private static const b6 = 6

    public static let c1: Father = Son()

    static const d1 = 1
    public static const d2 = d1

    static const e1 = 1
    static let e2 = 2
    public static const func e3() {
        e1
    }

    @Frozen
    public func e4() {
        e2
    }
}
