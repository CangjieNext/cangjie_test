/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
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


