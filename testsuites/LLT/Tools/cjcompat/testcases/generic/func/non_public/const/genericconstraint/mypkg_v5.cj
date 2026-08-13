// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V5
public interface Eq<T> {
	func eq(other: T): Bool
}

public interface Ord<T> <: Eq<T> {
	func lt(other: T): Bool
}

extend Int64 <: Eq<Int64> {
	public func eq(other: Int64): Bool {
        true;
    }
}

const func foo<T>(a: Int64) where T <: Eq<T> {
	0
}

public const func f2(): Int64 { foo<Int64>(1);0 }
