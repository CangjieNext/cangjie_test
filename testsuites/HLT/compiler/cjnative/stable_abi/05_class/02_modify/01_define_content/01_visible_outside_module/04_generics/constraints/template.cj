/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: generic constraints
public open class Father {}

public class Son <: Father {}

public class Son1 <: Father {}

public open class Generics<T, U> where T <: Father, U <: Son {
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

    public func goo3(a: T, b: U) {
        return (a, b)
    }
}

public func checker(): Int64 {
    let g1 = Generics<Father, Son>(101)
    if (g1._v1 == 0 && g1._v2 == 1 && g1._v3 == 101
        && g1.goo1(1) == 10 && Generics<Father, Son>.goo2(10) == 100 && (g1.goo3(Father(), Son()) is (Father, Son))) {
    } else {
        return 1
    }
    g1._v2 = 202
    if (g1._v1 == 202) {
    } else {
        return 1
    }
    0
}
