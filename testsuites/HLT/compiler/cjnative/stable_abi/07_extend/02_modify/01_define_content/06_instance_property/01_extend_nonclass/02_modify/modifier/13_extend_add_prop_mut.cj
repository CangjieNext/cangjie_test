/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.6.1.2.13
  @Scene: modify
  @Visibility: public
  @Object: extend instance prop
  @Behavior: add modifier static
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
// ASSERT: scan [API/ABI] xxx
// ASSERT: scan-4 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test extend: instance property
public struct TestStruct {
    public var a: Int64 = 0
}

extend TestStruct {
    public mut prop prop1: Int64 {
        get() {
            1
        }
        set(v) {
        }
    }

    protected mut prop exported_prop1: Int64 {
        get() {
            1
        }
        set(v) {
        }
    }
    mut prop prop2: Int64 {
        get() {
            2
        }
        set(v) {
        }
    }

    mut prop prop3: Int64 {
        get() {
            3
        }
        set(v) {
        }
    }
    @Frozen
    public mut prop _prop3: Int64 {
        get () {
            prop3
        }
        set(v) {
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public mut prop prop4: Int64 {
        get() {
            4
        }
        set(v) {
        }
    }
    @Deprecated["This API is deprecated", strict: true]
    public mut prop prop5: Int64 {
        get() {
            5
        }
        set(v) {
        }
    }
    @Frozen
    public mut prop prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected mut prop prop7: Int64 {
        get() {
            7
        }
        set(v) {
        }
    }
    internal mut prop prop8: Int64 {
        get() {
            8
        }
        set(v) {
        }
    }
    private mut prop prop9: Int64 {
        get() {
            9
        }
        set(v) {
        }
    }

    public mut prop prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    public mut prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
}
