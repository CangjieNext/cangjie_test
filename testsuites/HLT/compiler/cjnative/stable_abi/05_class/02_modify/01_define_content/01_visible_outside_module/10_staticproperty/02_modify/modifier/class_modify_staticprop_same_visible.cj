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
  @Visibility: non public
  @Object: class static prop
  @Behavior: modifier nonpublic to nonpublic
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test class: static property
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class TestClass {
    public static var a: Int64 = 0
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

    public static prop prop7: Int64 {
        get() {
            7
        }
    }
    protected static prop prop8: Int64 {
        get() {
            8
        }
    }
    internal static prop prop9: Int64 {
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
    
    @Version["1.1"]
    public static prop prop12: Int64 {
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

public func checker(): Unit {
    assert(TestClass.prop1, 1)
    assert(TestClass._prop3, 3)
    assert(TestClass.prop4, 4)
    assert(TestClass.prop6, 6)
    assert(TestClass.prop10, 10)
    assert(TestClass.prop11, 11)
    assert(TestClass.prop12, 12)
    assert(TestClass.a, -1)
}
