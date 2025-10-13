// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public interface I1 {}

public struct Foo <: I1 {
    public Foo(public var a!: Int64 = 1) {}
}

public func f(i: I1) {
    match (i) {
        case v: Foo where v.a == 1 => v.a
        case v: Foo where v.a != 1 => v.a
        case _ => 0
    }
}
