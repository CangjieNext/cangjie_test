/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.5.3
  @Scene: modify
  @Visibility: public |used in public const declare | used in public struct/class instance var
  @Object: enum
  @Behavior: modify implement interface
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-3 [API/ABI] Changed interfaces that enum implemented.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-3 [API/ABI]

// test enum: modify interface
// 修改实现接⼝ A 为 B
package test_stable_abi

open class Base {}

public class c1 <: Base {}

interface I {
    func f(): Base
}

interface Addable {
    func add(other: Int64): Int64 {
        return 0
    }
}

interface Subtractable {
    func sub(other: Int64): Int64 {
        return 0
    }
}

public enum MyInt <: Addable & Subtractable {
    | Red | Green | Blue(UInt8)

    public func add(other: Int64): Int64 {
        10 + other
    }
    public func sub(other: Int64): Int64 {
        10 - other
    }
}

public enum S7 <: Subtractable {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8 <: Subtractable {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S9 <: Subtractable {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

public class C1 {
    let v1 = S8.Red

    const init() {
        let v3 = 0
    }

    public const func f1() {
        let v2 = S9.Green
    }
}
