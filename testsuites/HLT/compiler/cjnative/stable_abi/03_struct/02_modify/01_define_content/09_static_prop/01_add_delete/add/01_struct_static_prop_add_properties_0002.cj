/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.1.1
  @Scene: add
  @Visibility: non public
  @Object: struct static prop
  @Behavior: add static properties
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

// test struct: add static properties
// 新增静态属性
package test_stable_abi


public struct Rectangle {
    let width = 10
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

public struct S1{
    static var a = 20
    public static prop getb: Int64 {
        get() {
            a
        }
    }
    
    public static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getgeta(){
        return geta
    }

    static mut prop getc: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}