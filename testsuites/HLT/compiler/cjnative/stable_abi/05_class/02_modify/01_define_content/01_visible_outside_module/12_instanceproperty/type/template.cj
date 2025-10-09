/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: property

public class TestClass {
    public static var a: Int64 = 0
    public prop prop1: Int64 {
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
        get () {
            prop3
        }
    }
}

open class baseClass {
    public var a: Int64 = 0
    public prop prop1: Int64 {
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
        get () {
            prop3
        }
    }
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    public var a: Int64 = 0
    public prop prop1: Int64 {
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
        get () {
            prop3
        }
    }
}


