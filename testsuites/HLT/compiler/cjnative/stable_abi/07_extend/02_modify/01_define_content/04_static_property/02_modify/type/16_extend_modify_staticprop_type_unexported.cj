/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 7.2.1.4.2.16
  @Scene: modify
  @Visibility: public
  @Object: extend static prop
  @Behavior: modify static prop type
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

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: static property
public class TestClass {
    public static var a: Int64 = 0
}

public struct TestStruct {
    public static var a: Int64 = 0
}

extend TestClass {
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
        get() {
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
    public mut static prop prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected static prop prop7: Int64 {
        get() {
            7
        }
    }
    internal static prop prop8: Int64 {
        get() {
            8
        }
    }
    private static prop prop9: Int64 {
        get() {
            9
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
}

extend TestStruct {
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
        get() {
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
    public mut static prop prop6: Int64 {
        get() {
            6
        }
        set(v) {
            a = v
        }
    }

    protected static prop prop7: Int64 {
        get() {
            7
        }
    }
    internal static prop prop8: Int64 {
        get() {
            8
        }
    }
    private static prop prop9: Int64 {
        get() {
            9
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
}

private interface I1 {}

internal interface I2 {}

extend Int64 <: I1 & I2 {
    public static func foo1(): String {
        "1"
    }
}

public class Foo<T> {}

extend<T> Foo<T> where T <: I1 {
    public static func f1(): Int32 {
        1
    }
}
