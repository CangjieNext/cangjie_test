/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.12.2
  @Scene: modify
  @Visibility: public
  @Object: class instance prop
  @Behavior: modifier add mut and its setter
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: ../../main.cj, ../../template.cj
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

// test class: instance property
// 不涉及open func的改动
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

open public class TestClass {
    public var a: Int64 = 0
    public mut prop prop1: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }

    protected mut prop exported_prop1: Int64 {
        get() {
            1
        }
        set(v) {
            a = v
        }
    }
    mut prop prop2: Int64 {
        get() {
            2
        }
        set(v) {
            a = v
        }
    }

    mut prop prop3: Int64 {
        get() {
            3
        }
        set(v) {
            a = v
        }
    }
    @Frozen
    public prop _prop3: Int64 {
        get () {
            prop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public mut prop prop4: Int64 {
        get() {
            4
        }
        set(v) {
            a = v
        }
    }
    @Deprecated["This API is deprecated", strict: true]
    public mut prop prop5: Int64 {
        get() {
            5
        }
        set(v) {
            a = v
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
            a = v
        }
    }
    internal mut prop prop8: Int64 {
        get() {
            8
        }
        set(v) {
            a = v
        }
    }
    private mut prop prop9: Int64 {
        get() {
            9
        }
        set(v) {
            a = v
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

    open public prop prop13: Int64 {
        get() {
            13
        }
    }

    open public mut prop prop14: Int64 {
        get() {
            14
        }
        set(v) {
            a = v
        }
    }   

    @Version["1.1"]
    public mut prop prop12: Int64 {
        get() {
            12
        }
        set(v) {
            a = v
        }
    }
}
