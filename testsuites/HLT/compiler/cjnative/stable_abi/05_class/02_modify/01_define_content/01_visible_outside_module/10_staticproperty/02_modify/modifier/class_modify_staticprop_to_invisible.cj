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
  @Behavior: modifier public to nonpublic
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 0-core
// DEPENDENCE: ../../main.cj, ../../template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible
// ASSERT: scan-4 [API/ABI] Class member property visible outside the module deleted or made private.
// ASSERT: scan-2 [API/ABI] Changed visibility of instance member properties for classes.
// ASSERT: scan-6 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

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
    private static prop prop1: Int64 {
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
    private static prop _prop3: Int64 {
        get () {
            prop3
        }
    }

    @Deprecated["This API will be deprecated soon"]
    internal static prop prop4: Int64 {
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
    protected static mut prop prop6: Int64 {
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

    public static mut prop prop10: Int64 {
        get() {
            10
        }
        set(v) {
        }
    }
    private static mut prop prop11: Int64 {
        get() {
            11
        }
        set(v) {
            a = v
        }
    }
    
    @Version["1.1"]
    private static prop prop12: Int64 {
        get() {
            12
        }
    }
}
