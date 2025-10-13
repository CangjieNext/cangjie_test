/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.8.2.7
  @Scene: add
  @Visibility: public
  @Object: struct static func
  @Behavior: add @Frozen
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

// test struct: add @Frozen
package test_stable_abi

public struct Rectangle {
    let width = 10
    static let a1 = 20

    @Frozen
    public func getWidth(): Int64 {
        return width
    }

    @Frozen
    static func geta(): Int64 {
        return 0
    }

    @Frozen
    public static func getb(): Int64 {
        return 0
    }

    @Frozen
    static func getc(): Int64 {
        return 0
    }

    @Frozen
    public static func getd() {
        let c = getc()
        return c
    }
}
