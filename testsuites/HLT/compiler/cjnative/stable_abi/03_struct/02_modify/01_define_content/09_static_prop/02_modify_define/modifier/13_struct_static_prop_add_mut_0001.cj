/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.2.13
  @Scene: add
  @Visibility: public
  @Object: struct static prop
  @Behavior: add mut and setter function 
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

// test struct: add mut and setter function 

package test_stable_abi

public struct Rectangle {
    static let width = 10
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    public static mut prop geta1: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    static mut prop geta2: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    public static mut prop geta3: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    private static mut prop geta4: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    internal static mut prop geta5: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    static mut prop geta6: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    protected static mut prop geta7: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    public static mut prop geta8: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    static mut prop geta9: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    static mut prop geta10: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

}

public struct S1{
    static var a = 20
    static var b = 20
    static var c = 20
    static var d = 20
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

    public mut static prop getb: Int64 {
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

    public static mut prop gete: Int64 {
        get() {
            e
        }
        set(value) {
            e = value
        }
    }

    static mut prop getf: Int64 {
        get() {
            f
        }
        set(value) {
            f = value
        }
    }

    @Frozen
    public func f3(){
        getf
    }

    public static mut prop getc: Int64 {
        get() {
            c
        }

        set(value) {
            c = value
        }
    }

    static prop getd: Int64 {
        get() {
            f
        }
    }

    @Frozen
    public func f4(){
        getd
    }
}