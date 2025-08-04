/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.10.2.11
  @Scene: delete
  @Visibility: non public
  @Object: struct instance func
  @Behavior: modifier: keep non public
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
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

// test struct: delete access modifier: Invisible to Invisible
package test_stable_abi

public struct Rectangle {
    static let width = 10

    public const init() {}

    public func getWidth(): Int64 {
        return width
    }

    public func geta1() {
        return 0
    }

    func geta2() {
        return 0
    }

    public func geta3() {
        return 0
    }

    func geta4() {
        return 0
    }

    func geta5() {
        return 0
    }

    func geta6() {
        return 0
    }

    func geta7() {
        return 0
    }

    public func geta8() {
        return 0
    }

    func geta9() {
        return 0
    }

    func geta10() {
        return 0
    }

    public unsafe func geta11() {
        return 0
    }

    public mut func geta12() {
        return 0
    }

    @Frozen
    public func geta13() {
        let x = geta2()
        return x
    }

    const func geta14() {
        return 0
    }

    public const func geta15() {
        let x = geta14()
        return x
    }

    mut func geta16() {
        return 0
    }

    @Frozen
    public mut func geta17() {
        let x = geta16()
        return x
    }
}
