/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.9.2.2
  @Scene: add
  @Visibility: public
  @Object: struct static prop
  @Behavior: add @Deprecated, strict false
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

// test struct: add @Deprecated
package test_stable_abi

public struct Rectangle {
    static let width = 10
    static var a = 10

    public func getWidth(): Int64{
        return width
    }
    static mut prop geta1:Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    public static mut prop geta2:Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    static mut prop getb: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getc1(){
        return getb
    }

    @Deprecated["this function is deprecated", strict: false]
    public static prop getc: Int64 {
        get() {
            a
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    static mut prop getd: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getgetd(){
        return getd
    }

    @Deprecated["this function is deprecated", strict: false]
    public static prop gete: Int64 {
        get() {
            a
        }
    }

     @Deprecated["this function is deprecated", strict: true]
    public static prop geth: Int64 {
        get() {
            a
        }
    }

    @Deprecated["this function is deprecated", strict: true]
    static mut prop getf: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    @Deprecated["this function is deprecated", strict: true]
    public func getgetf(){
        return getf
    }
}
