/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 7.2.1.6.1.1.1
  @Scene: add
  @Visibility: public
  @Object: extend instance prop
  @Behavior: add instance member prop
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
public struct TestStruct {
    public var a: Int64 = 0
}

extend TestStruct {
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
    public prop aprop1: Int64 {
        get() {
            1
        }
    }

    prop aprop2: Int64 {
        get() {
            2
        }
    }

    prop aprop3: Int64 {
        get() {
            3
        }
    }
    @Frozen
    public prop _aprop3: Int64 {
        get () {
            aprop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    public prop aprop4: Int64 {
        get() {
            4
        }
    }
    @Deprecated["This API is deprecated", strict: true]
    public prop aprop5: Int64 {
        get() {
            5
        }
    }
    @Frozen
    public mut prop aprop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected prop aprop7: Int64 {
        get() {
            7
        }
    }
    internal prop aprop8: Int64 {
        get() {
            8
        }
    }
    private prop aprop9: Int64 {
        get() {
            9
        }
    }

    public mut prop aprop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    public mut prop aprop11: Int64 {
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
    assert(TestStruct().aprop1, 1)
    assert(TestStruct().aprop2, 2)
    assert(TestStruct().aprop3, 3)
    assert(TestStruct()._aprop3, 3)
    assert(TestStruct().aprop4, 4)
    assert(TestStruct().aprop6, 6)
    assert(TestStruct().aprop7, 7)
    assert(TestStruct().aprop8, 8)
    assert(TestStruct().aprop10, 10)
    assert(TestStruct().aprop11, 11)
}
