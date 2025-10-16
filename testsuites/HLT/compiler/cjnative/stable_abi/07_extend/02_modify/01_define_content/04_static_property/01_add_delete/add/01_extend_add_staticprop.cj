/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.4.1.1
  @Scene: add
  @Visibility: public,used in public @Frozen declare
  @Object: extend static prop
  @Behavior: add static prop
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test extend: static property
public class TestClass {
    public static var a: Int64 = 0
}
public struct TestStruct {
    public static var a: Int64 = 0
}

extend TestClass {
    public static prop prop1: Int64 {
        get() {
            1
        }
    }

    static prop prop2: Int64 {
        get() {
            2
        }
    }

    static prop prop3: Int64 {
        get() {
            3
        }
    }
    @Frozen
    public static prop _prop3: Int64 {
        get () {
            prop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public static prop prop4: Int64 {
        get() {
            4
        }
    }
    @Deprecated["This API is deprecated", strict: true]
    public static prop prop5: Int64 {
        get() {
            5
        }
    }
    @Frozen
    public static mut prop prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected static prop prop7: Int64 {
        get() {
            7
        }
    }
    internal static prop prop8: Int64 {
        get() {
            8
        }
    }
    private static prop prop9: Int64 {
        get() {
            9
        }
    }

    public static mut prop prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    public static mut prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
    public static prop _prop1: Int64 {
        get() {
            1
        }
    }

    static prop _prop2: Int64 {
        get() {
            2
        }
    }

    static prop p_prop3: Int64 {
        get() {
            3
        }
    }
    @Frozen
    public static prop f_prop3: Int64 {
        get () {
            prop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public static prop _prop4: Int64 {
        get() {
            4
        }
    }
    @Deprecated["This API is deprecated", strict: true]
    public static prop _prop5: Int64 {
        get() {
            5
        }
    }
    @Frozen
    public static mut prop _prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected static prop _prop7: Int64 {
        get() {
            7
        }
    }
    internal static prop _prop8: Int64 {
        get() {
            8
        }
    }
    private static prop _prop9: Int64 {
        get() {
            9
        }
    }

    public static mut prop _prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    public static mut prop _prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
}

extend TestStruct {
    public static prop prop1: Int64 {
        get() {
            1
        }
    }

    static prop prop2: Int64 {
        get() {
            2
        }
    }

    static prop prop3: Int64 {
        get() {
            3
        }
    }
    @Frozen
    public static prop _prop3: Int64 {
        get () {
            prop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public static prop prop4: Int64 {
        get() {
            4
        }
    }
    @Deprecated["This API is deprecated", strict: true]
    public static prop prop5: Int64 {
        get() {
            5
        }
    }
    @Frozen
    public static mut prop prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected static prop prop7: Int64 {
        get() {
            7
        }
    }
    internal static prop prop8: Int64 {
        get() {
            8
        }
    }
    private static prop prop9: Int64 {
        get() {
            9
        }
    }

    public static mut prop prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    public static mut prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
    public static prop _prop1: Int64 {
        get() {
            1
        }
    }

    static prop _prop2: Int64 {
        get() {
            2
        }
    }

    static prop p_prop3: Int64 {
        get() {
            3
        }
    }
    @Frozen
    public static prop f_prop3: Int64 {
        get () {
            p_prop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public static prop _prop4: Int64 {
        get() {
            4
        }
    }
    @Deprecated["This API is deprecated", strict: true]
    public static prop _prop5: Int64 {
        get() {
            5
        }
    }
    @Frozen
    public static mut prop _prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected static prop _prop7: Int64 {
        get() {
            7
        }
    }
    internal static prop _prop8: Int64 {
        get() {
            8
        }
    }
    private static prop _prop9: Int64 {
        get() {
            9
        }
    }

    public static mut prop _prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    public static mut prop _prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
}
