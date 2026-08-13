// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// test class: instance property
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

open public class TestClass {
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

    public prop prop10: Int64 {
        get() {
            10
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

    open public prop prop13: Int64 {
        get() {
            13
        }
    }

    open public mut prop prop14: Int64 {
        get() {
            14
        }
        set(v) {
            a = v
        }
    }   

    @Version["1.1"]
    public prop prop12: Int64 {
        get() {
            12
        }
    }
}
