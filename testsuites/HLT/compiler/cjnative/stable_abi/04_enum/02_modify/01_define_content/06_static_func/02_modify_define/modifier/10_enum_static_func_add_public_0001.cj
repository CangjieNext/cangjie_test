/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.10
  @Scene: add
  @Visibility: non public
  @Object: enum static func
  @Behavior: modifier: non public -> public
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: add access modifier: Invisible to Visible
package test_stable_abi

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    public static func geta1() {
        return 0
    }

    static func geta2() {
        return 0
    }

    public static func geta3() {
        return 0
    }

    private static func geta4() {
        return 0
    }

    internal static func geta5() {
        return 0
    }

    static func geta6() {
        return 0
    }

    protected static func geta7() {
        return 0
    }

    public static func geta8() {
        return 0
    }

    static func geta9() {
        return 0
    }

    public static func geta10() {
        return 0
    }

    unsafe public static func geta11() {
        return 0
    }

    static const func geta12() {
        return 1
    }

    @Frozen
    public static func geta13() {
        let x = geta12()
        return x
    }

    public static const func geta14() {
        return 0
    }

    @Frozen
    public func geta15() {
        let y = geta10()
        return y
    }

    static const func geta16() {
        return 1
    }

    public static func geta17() {
        const z = geta16()
        return z
    }
}