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
  @Visibility: non-public enum used in @Frozen declare and non-public static prop
  @Object: enum static prop
  @Behavior: modify property type
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args


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

@Frozen
public func test() {
    S1.AB
    1
}

enum S1 {
    AB

    public static prop geta: Int64 {
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

    static prop getc: Int16 {
        get() {
            0
        }
    }

    @Frozen
    public func f1(){
        getb
    }
}