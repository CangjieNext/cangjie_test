/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.9.2.16
  @Scene: modify
  @Visibility: non-public enum used in struct member variable and non-public instance prop used in @Frozen declare
  @Object: enum instance prop
  @Behavior: modify prop type
  @Expect: api incompatible & abi incompatible
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
// ASSERT: scan-1 [API/ABI] Changed member property's return type of enum visible outside the module.
// ASSERT: scan-1 [API/ABI] Changed return type of function visible outside the module. The new return type is not a subtype of the old return type.
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-2 [API/ABI]

// 修改属性类型
package test_stable_abi


public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    public prop geta: Int64 {
        get() {
            println("get")
            11 + 1
        }
    }

    @Frozen
    public prop getc: Int64 {
        get() {
            println("get")
            11 + 1
        }
    }
}

public struct A {
    let a: Int64 = 20
    let b = S1.AB
}

enum S1 {
    AB

    public prop geta: Int64 {
        get() {
            0
        }
    }

    @Frozen
    prop getb: Int32 {
        get() {
            0
        }
    }

    prop getc: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f1(){
        getb
    }
}