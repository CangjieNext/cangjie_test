/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.7.2.15
  @Scene: modify
  @Visibility: used in public @Frozen declare
  @Object: enum static prop
  @Behavior: modify property name
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-1 [API/ABI] Deleted public member property of enum visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: delete non public member function
// 修改属性名
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

public enum S1{
    AB

    @Frozen
    public static prop geta: Int64 {
        get() {
            0
        }
    }

    @Frozen
    static prop getbb: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f1(){
        getbb
    }
}