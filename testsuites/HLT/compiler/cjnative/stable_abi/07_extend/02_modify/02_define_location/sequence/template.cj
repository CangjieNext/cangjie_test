/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: position
public open class TestStruct {
    public const init() {}
}

public enum TestE1{
    XY
}

public interface I {
    func f(): Unit
    prop propa: Int64
    mut prop propb: Int64
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
}

extend TestStruct <: I {
    public func f(): Unit {}
    public prop propa: Int64 {
        get() {
            1
        }
    }
    public mut prop propb: Int64 {
        get() {
            6
        }
        set(v) {
            v
        }
    }

    protected mut prop propc: Int64 {
        get() {
            6
        }
        set(v) {
            v
        }
    }

    prop propd: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func f1() {
        propd
    }
}

extend TestE1 {
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
}


