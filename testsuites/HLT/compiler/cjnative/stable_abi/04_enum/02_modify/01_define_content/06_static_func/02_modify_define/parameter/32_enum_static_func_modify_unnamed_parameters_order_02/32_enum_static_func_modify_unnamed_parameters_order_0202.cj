/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.32
  @Scene: modify
  @Visibility: used in public class decl
  @Object: enum[static member function]
  @Behavior: modify unnamed parameters order
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

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed unnamed parameter order of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test enum: modify unnamed parameters order
// 修改非命名参数的顺序

package test_stable_abi

import std.random.*

public class A { var a = Rectangle.Red }

enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    @Frozen
    public static func getA( a: Random, b: Int64): Int64 {
        let x = getC(1, 1)
        return b
    }

    public const static func getB(a: Int64, b: Int64): Int64 {
        let x = getD(1, 1)
        return b
    }

    static const func getC(b: Int64, a: Int64): Int64 {
        return b
    }

    static const func getD(a: Int64, b: Int64): Int64 {
        return b
    }

    static const func getE(a: Int64, b: Int64): Int64 {
        return b
    }
}

