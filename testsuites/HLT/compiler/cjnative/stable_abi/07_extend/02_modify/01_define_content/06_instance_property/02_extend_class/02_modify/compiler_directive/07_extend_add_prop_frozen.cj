/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 7.2.1.6.2.2.7
  @Scene: modify
  @Visibility: public
  @Object: extend instance prop
  @Behavior: add compilation flag @Frozen
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

// test extend: instance property
public open class TestClass {
    public var a: Int64 = 0
}

extend TestClass {
    @Frozen
    public prop prop1: Int64 {
        get() {
            1
        }
    }

    @Frozen
    protected prop exported_prop1: Int64 {
        get() {
            1
        }
    }

    @Frozen
    prop prop2: Int64 {
        get() {
            2
        }
    }

    @Frozen
    prop prop3: Int64 {
        get() {
            3
        }
    }

    @Frozen
    public prop _prop3: Int64 {
        get() {
            prop3
        }
    }

    @Frozen
    @Deprecated["This API will be deprecated soon"]
    public prop prop4: Int64 {
        get() {
            4
        }
    }

    @Deprecated["This API is deprecated", strict: true]
    @Frozen
    public prop prop5: Int64 {
        get() {
            5
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

    @Frozen
    protected prop prop7: Int64 {
        get() {
            7
        }
    }
    internal prop prop8: Int64 {
        get() {
            8
        }
    }

    @Frozen
    private prop prop9: Int64 {
        get() {
            9
        }
    }

    public mut prop prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }

    @Frozen
    public mut prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
}
