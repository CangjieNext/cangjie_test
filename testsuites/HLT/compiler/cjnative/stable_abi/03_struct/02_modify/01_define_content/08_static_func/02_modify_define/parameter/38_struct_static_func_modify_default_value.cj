/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.8.2.38
  @Scene: modify
  @Visibility: public
  @Object: struct static func
  @Behavior: modify function default value
  @Expect: api compatible & abi compatible
 */
// LEVEL: 0
// Expect: API Compatible & ABI Compatible
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

// test struct: delete non public static member function
// 修改参数的默认值
package test_stable_abi

import std.random.*

public struct Rectangle {
    let width = 10

    public func getWidth(): Int64 {
        return width
    }

    public static func geta(aa: Random, b!: Int64, c!: Int64 = 2): Int64 {
        return b + c
    }
}
