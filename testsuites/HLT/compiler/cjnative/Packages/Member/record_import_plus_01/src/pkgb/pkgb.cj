/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb

import pkga.*
import pkga

public func boo(): Int64 {
    var b0: Int64 = 2
    var b: Data_a<Int64> = Data_a<Int64>(b0, b0)
    if (pkga.a.area() != 1) {
        return 1
    }
    if (b.area() != 2) {
        return 1
    }
    return 0
}

public struct Data_b<T> {
    public let width: T
    public let length: T
    public let b: Data_a<T>
    public init(width1: T, length1: T, other: Data_a<T>) {
        width = width1
        length = length1
        b = other
    }
    public func area(): T {
        return b.area()
    }
}
