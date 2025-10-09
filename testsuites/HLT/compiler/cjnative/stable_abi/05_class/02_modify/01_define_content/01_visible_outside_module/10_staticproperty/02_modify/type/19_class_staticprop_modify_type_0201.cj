/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.2.1.1.10.2.19
  @Scene: modify
  @Visibility: public
  @Object: class static prop
  @Behavior: modify type of class static prop
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
// ASSERT: scan-1 [API/ABI] Changed member property's return type of class visible outside the module.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: static property
public class TestClass {
    public static var a: Int64 = 0
    public static prop prop1: Int64 {
        get() {
            1
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
}

open class baseClass {
    public static var a: Int64 = 0
    public static prop prop1: Byte {
        get() {
            1
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
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    public static var a: Int64 = 0
    public static prop prop1: Int64 {
        get() {
            1
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
}

