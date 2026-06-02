// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public struct Test {
    public let val: Int64
    public init(val: Int64) {
        this.val = val
    }
}

public interface AddInt64I {
    func add(right: Int64): Int64
}

extend Test <: AddInt64I {
    public func add(right: Int64): Int64 {
        return val + right
    }
}

public interface CastToInt64 {
    func toInt64(): Int64
}

extend Test <: CastToInt64 {
    public func toInt64(): Int64 {
        return val
    }
}
