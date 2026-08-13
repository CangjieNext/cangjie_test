// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public interface Eq<T> {
	func eq(other: T): Bool
}

public interface Ord<T> <: Eq<T> {
	func lt(other: T): Bool
}

public class Foo {
	public func foo<T>(a: Int64) where T <: Ord<T> {
		0
	}
}