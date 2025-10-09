/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.5.4
  @Scene: modify
  @Visibility: public
  @Object: enum
  @Behavior: modify implement interface order
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

// test enum: modify interface
// 修改实现接口的顺序
package test_stable_abi

open class Base {}
public class c1 <: Base {}

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

public enum MyInt <: Subtractable & Addable {
    | Red | Green | Blue(UInt8)
    public func add(other: Int64): Int64 {
        10 + other
    }
    public func sub(other: Int64): Int64 {
        10 - other
    }

}

public enum S7 <: Addable {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S8 <: Addable {
    | Red | Green | Blue(UInt8)

    public func getX(): Int64 {
        return 11
    }
}

enum S9 <: Addable {
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
