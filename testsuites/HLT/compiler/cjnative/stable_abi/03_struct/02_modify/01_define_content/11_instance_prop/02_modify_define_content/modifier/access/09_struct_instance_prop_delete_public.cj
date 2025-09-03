/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 3.2.1.12.2.9
  @Scene: modify
  @Visibility: public
  @Object: struct instance prop
  @Behavior: modifier: public -> non public
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
// ASSERT: scan-1 [API/ABI] Changed member property's modifier of struct visible outside the module. public/mut/static deleted or mut/static added.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

public struct S {
    var a = 10
    mut prop p1: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    protected mut prop p2: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    protected mut prop p3: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    internal mut prop p4: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    internal mut prop p5: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    private mut prop p6: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    private mut prop p7: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    mut prop p8: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    mut prop p9: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    mut prop p10: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}
