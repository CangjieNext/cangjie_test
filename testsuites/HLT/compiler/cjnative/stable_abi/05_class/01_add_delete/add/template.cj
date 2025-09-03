/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: add new class
public open class Father {
    public var v1 = 0
    public mut prop v2: Int64 {
        get() {
            v1 + 1
        }
        set(value) {
            v1 = value
        }
    }
    public var v3: Int64

    public open func foo1(a: Int64) {
        10
    }

    public static func foo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this.v3 = input
    }
}

public open class Generics<T> {
    public var _v1 = 0
    public mut prop _v2: Int64 {
        get() {
            _v1 + 1
        }
        set(value) {
            _v1 = value
        }
    }
    public var _v3: Int64

    public open func goo1(a: Int64) {
        10
    }

    public static func goo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this._v3 = input
    }

    public func goo3(a: T) {
        return a
    }
}
