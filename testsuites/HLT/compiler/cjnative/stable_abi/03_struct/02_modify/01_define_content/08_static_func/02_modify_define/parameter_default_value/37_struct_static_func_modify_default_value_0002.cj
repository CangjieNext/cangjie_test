/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.8.2.37
  @Scene: modify
  @Visibility: public
  @Object: struct static func
  @Behavior: modify const or frozen function default value
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
// ASSERT: scan-1 [ABI] Changed parameter default value of a const function or function marked with @Frozen.
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]
// test struct: modify public const function body.
// 修改参数的默认值

package test_stable_abi

import std.random.*

public struct Rectangle {
    let width = 10
    static let a1 = 20

    public func getWidth(): Int64{
        return width
    }

    public static func geta(a: Random, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }


    static func getb(a: Random, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static func getc(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    @Frozen
    public static func getd(b!: Int64 = 2, c!: Int64 = 3): Int64 {
        return getc(0, b: b, c: c)
    }


    public static const func getf(b!: Int64, c!: Int64 = 1) {
        return 0
    }


}