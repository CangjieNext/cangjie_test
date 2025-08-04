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
  @Behavior: add @Deprecated, strict true
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed member property's annotation of struct visible outside the module. Deprecated strict added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: add @Deprecated
package test_stable_abi

public struct Rectangle {
    static let width = 10
    static var a = 10

    public func getWidth(): Int64 {
        return width
    }
    mut static prop geta1: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    public mut static prop geta2: Int64 {
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
    mut static prop geta3: Int64 {
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
    public mut static prop geta4: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    @Deprecated["this function is deprecated", strict: true]
    public mut static prop geta5: Int64 {
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

public struct S1 {
    static var a = 20

    @Deprecated["this function is deprecated", strict: true]
    public static prop getb: Int64 {
        get() {
            a
        }
    }

    mut static prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getgeta() {
        return geta
    }

    @Deprecated["this function is deprecated", strict: false]
    public static prop getc: Int64 {
        get() {
            a
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    mut static prop getd: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getgetd() {
        return getd
    }
}
