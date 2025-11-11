/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.2.15
  @Scene: modify
  @Visibility: used in public @Frozen declare
  @Object: struct static prop
  @Behavior: modify properties name
  @Expect: api compatible & abi incompatible
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
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-1 [API/ABI] Deleted public member property of struct visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: delete non public static member function
// 修改静态属性名
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

    static mut prop getbb: Int64 {
        get() {
            b
        }
        set(value) {
            b = value
        }
    }

    @Frozen
    public func f1(){
        getbb
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
            f
        }
        set(value) {
            f = value
        }
    }

    @Frozen
    public func f2(){
        getf
    }
}