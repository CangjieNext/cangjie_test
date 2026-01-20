/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 5.1
  @Scene: delete
  @Visibility: public
  @Object: class
  @Behavior: delete public class
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible
// ASSERT: scan-2 [API/ABI] Class declaration visible outside the module deleted or made private.
// ASSERT: scan-2 [API/ABI] Function declaration visible outside the module deleted or made private.
// ASSERT: scan-4 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test class: delete classes
class Father2 {
    var v1 = 0
    mut prop v2: Int64 {
        get() {
            v1 + 1
        }
        set(value) {
            v1 = value
        }
    }
    var v3: Int64

    open func foo1(a: Int64) {
        10
    }

    static func foo2(a: Int64) {
        100
    }

    init(input: Int64) {
        this.v3 = input
    }
}

class Generics2<T> {
    var _v1 = 0
    mut prop _v2: Int64 {
        get() {
            _v1 + 1
        }
        set(value) {
            _v1 = value
        }
    }
    var _v3: Int64

    open func goo1(a: Int64) {
        10
    }

    static func goo2(a: Int64) {
        100
    }

    init(input: Int64) {
        this._v3 = input
    }

    func goo3(a: T) {
        return a
    }
}
