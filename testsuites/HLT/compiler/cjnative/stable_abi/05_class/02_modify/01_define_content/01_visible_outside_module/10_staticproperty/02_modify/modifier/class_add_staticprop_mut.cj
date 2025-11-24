/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 5.2.1.1.10.2
  @Scene: modify
  @Visibility: public
  @Object: class static prop
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

// test class: static mut property
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class TestClass {
    public static var a: Int64 = 0
    public mut static prop prop1: Int64 {
        get() {
            1
        }
        set(v) {
        }
    }

    mut static prop prop2: Int64 {
        get() {
            2
        }
        set(v) {
        }
    }

    mut static prop prop3: Int64 {
        get() {
            3
        }
        set(v) {
        }
    }

    @Frozen
    public mut static prop _prop3: Int64 {
        get() {
            prop3
        }
        set(v) {
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public mut static prop prop4: Int64 {
        get() {
            4
        }
        set(v) {
        }
    }

    @Deprecated["This API is deprecated", strict: true]
    public mut static prop prop5: Int64 {
        get() {
            5
        }
        set(v) {
        }
    }

    @Frozen
    public mut static prop prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected mut static prop prop7: Int64 {
        get() {
            7
        }
        set(v) {
        }
    }
    internal mut static prop prop8: Int64 {
        get() {
            8
        }
        set(v) {
        }
    }
    private mut static prop prop9: Int64 {
        get() {
            9
        }
        set(v) {
        }
    }

    public mut static prop prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    public mut static prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }

    @Version["1.1"]
    public mut static prop prop12: Int64 {
        get() {
            12
        }
        set(v) {
        }
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    assert(TestClass.prop1, 1)
    TestClass.prop1 = 1
    assert(TestClass._prop3, 3)
    TestClass._prop3 = 3
    assert(TestClass.prop4, 4)
    TestClass.prop4 = 4
    assert(TestClass.prop6, 6)
    TestClass.prop6 = 6
    assert(TestClass.prop10, 10)
    TestClass.prop10 = 10
    assert(TestClass.prop11, 11)
    TestClass.prop11 = 11
    assert(TestClass.prop12, 12)
    TestClass.prop12 = 12
    TestClass.prop11 = -1
    assert(TestClass.a, -1)
}
