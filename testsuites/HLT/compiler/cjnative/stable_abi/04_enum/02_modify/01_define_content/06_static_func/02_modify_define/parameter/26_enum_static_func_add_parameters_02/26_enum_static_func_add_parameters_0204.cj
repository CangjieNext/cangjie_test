/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.26
  @Scene: add
  @Visibility: used in public class decl
  @Object: enum[static member function]
  @Behavior: add parameters
  @Expect: api compatible & abi compatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API]
// ASSERT: scan-2 [ABI]
// ASSERT: scan-not [API/ABI]

// test enum: public static member function add parameters
// 新增函数参数
package test_stable_abi

import std.random.*

public class A { var a = RectangleB.Red }

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    @Frozen
    public static func getA(a: Random, b!: Int64, c!: Int64 = 1): Int64 {
        let x = getC(1, b:1)
        return b + c
    }

    public const static func getB(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        let x = getC(1, b:1)
        return b + c
    }

    static const func getC(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }
}

enum RectangleB {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    @Frozen
    public static func getA(a: Random, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    public const static func getB(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static const func getC(a: Int64, aa: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }
}