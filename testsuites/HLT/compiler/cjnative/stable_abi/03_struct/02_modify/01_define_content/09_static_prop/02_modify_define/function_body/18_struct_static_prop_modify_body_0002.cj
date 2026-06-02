/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.2.18
  @Scene: modify
  @Visibility: used in public @Frozen declare
  @Object: struct static prop
  @Behavior: modify getter/setter for properties marked with @Frozen  
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-2 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-2 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test struct: delete non public static member function
// 修改标记@Frozen函数的函数体
package test_stable_abi


public struct Rectangle {
    let width = 10
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    static public mut prop geta: Int64 {
        get() {
            println("get")
            a + 1
        }
        set(value) {
            println("set")
            a = value + 1
        }
    }

    @Frozen
    static public mut prop getc: Int64 {
        get() {
            println("get")
            a + 1
        }
        set(value) {
            println("set")
            a = value + 1
        }
    }
}

public struct S1{
    static var a = 20
    static var b = 20
    static var e = 20
    static var f = 20

    public static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop getb: Int64 {
        get() {
            b
        }
        set(value) {
            b = value
        }
    }

    @Frozen
    public func f1(){
        getb
    }

    @Frozen
    public static prop gete: Int64 {
        get() {
            e
        }
    }
    @Frozen
    static mut prop getf: Int64 {
        get() {
            f+1
        }
        set(value) {
            f = value+1
        }
    }

    @Frozen
    public func f2(){
        getf
    }
}