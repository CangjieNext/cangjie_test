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
  @Behavior: modify annotations
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
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public open class TestClass {
    public var a: Int64 = 0
    public prop prop1: Int64 {
        get() {
            1
        }
    }

    protected prop exported_prop1: Int64 {
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
        get() {
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
    public mut prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }

    public open prop prop13: Int64 {
        get() {
            13
        }
    }

    public mut open prop prop14: Int64 {
        get() {
            14
        }
        set(v) {
            a = v
        }
    }

    @Version["\0\r\n1.1\0\r\n"]
    public prop prop12: Int64 {
        get() {
            12
        }
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(tc: TestClass): Unit {
    assert(tc.prop1, 1)
    assert(tc._prop3, 3)
    assert(tc.prop4, 4)
    assert(tc.prop6, 6)
    assert(tc.prop10, 10)
    assert(tc.prop11, 11)
    assert(tc.prop13, 13)
    assert(tc.prop14, 14)
    assert(tc.prop12, 12)
    assert(tc.a, -1)
}
