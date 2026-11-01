// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
interface Eq<T> {
	func eq(other: T): Bool
}

extend Int64 <: Eq<Int64> {
	public func eq(other: Int64): Bool {
        true;
    }
}

public struct Foo  {
     func foo<T>(p1: T) where T <: Eq<T> {
        var a: T = p1
        a
    }
    @Frozen
    public func f2(): Int64 { foo(1);0 }
}
