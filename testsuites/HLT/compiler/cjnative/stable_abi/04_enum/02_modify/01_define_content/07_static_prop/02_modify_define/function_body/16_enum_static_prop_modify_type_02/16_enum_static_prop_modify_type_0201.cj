/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.7.2.16
  @Scene: modify
  @Visibility: non-public enum used in class member variable and public static prop
  @Object: enum static prop
  @Behavior: modify property type
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
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed member property's return type of enum visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// 修改属性类型
package test_stable_abi


public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    static public prop geta: Int64 {
        get() {
            println("get")
            11 + 1
        }
    }

    @Frozen
    static public prop getc: Int64 {
        get() {
            println("get")
            11 + 1
        }
    }
}

public class A {
    let a: Int64 = 20
    let b = S1.AB
}

enum S1 {
    AB

    public static prop geta: Int16 {
        get() {
            0
        }
    }

    @Frozen
    static prop getb: Int64 {
        get() {
            0
        }
    }

    static prop getc: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f1(){
        getb
    }
}