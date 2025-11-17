/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.6.2.2.9
  @Scene: modify
  @Visibility: public
  @Object: extend instance prop
  @Behavior: modify modifier changed from public to nonpublic
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
// ASSERT: scan-2 [API/ABI] Extend member property visible outside the module deleted or made private.
// ASSERT: scan-3 [API/ABI] Changed visibility of the member property of the extend.
// ASSERT: scan-5 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test extend: instance property
open public class TestClass {
    public var a: Int64 = 0
}

extend TestClass {
    prop prop1: Int64 {
        get() {
            1
        }
    }

    prop exported_prop1: Int64 {
        get() {
            1
        }
    }
    prop prop2: Int64 {
        get() {
            2
        }
    }

    prop prop3: Int64 {
        get() {
            3
        }
    }
    @Frozen
    public prop _prop3: Int64 {
        get () {
            prop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public prop prop4: Int64 {
        get() {
            4
        }
    }
    @Deprecated["This API is deprecated", strict: true]
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

    private prop prop7: Int64 {
        get() {
            7
        }
    }
    internal prop prop8: Int64 {
        get() {
            8
        }
    }
    private prop prop9: Int64 {
        get() {
            9
        }
    }

    private mut prop prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    internal mut prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    var tc = TestClass()
    assert(tc.exported_prop1, 1)
    assert(tc.prop2, 2)
    assert(tc.prop3, 3)
    assert(tc.prop8, 8)
}
