// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*

public struct Vector {
    private var value: Int32 = 0

    public init() {
        throw Exception("Exception in Vector init!")
    }

    public init(a: Int32, b: Int32) {
        value = a + b
    }

    public func dot(vec: Vector): Int32 {
        throw Exception("Exception in Vector dot!")
        vec.value
    }

    public func div(a: Int64, b: Int64): Int64 {
       a / b
    }

    public static func hello(): Unit {
        throw Exception("Exception in Vector static hello!")
    }
}
