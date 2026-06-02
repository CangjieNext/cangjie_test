// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public open class AAA<T> {
    public open func foo1(): Int64 {
        1
    }
}

public open class BBB<M, N> <: AAA<M> {
    public func foo1(): Int64 {
        2
    }
    public open func foo2(): Int64 {
        3
    }
}
