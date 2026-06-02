/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public struct Data<T> {
    public let width: T
    public let length: T
    public init(width1: T, length1: T) {
        width = width1
        length = length1
    }
    public func area(): T {
        return width
    }
}

var a0: Int64 = 1
public var a: Data<Int64> = Data<Int64>(a0, a0)

public func aoo(): Int64 {
    var b0: Int64 = 2
    var b: Data<Int64> = Data<Int64>(b0, b0)
    if (a.area() != 1) {
        return 1
    }
    if (b.area() != 2) {
        return 1
    }
    return 0
}
