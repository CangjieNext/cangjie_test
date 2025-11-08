// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package up

interface I {
    func foo(): Int64 { 0 }
}

public class C<T> <: I {
    public var a: Int64 = 0
    func hoo(): Int64 { a }
    @Frozen
    public func foo(): Int64 { hoo() }
}

public func foo<T>(x: C<T>): Int64 {
    x.a
}
