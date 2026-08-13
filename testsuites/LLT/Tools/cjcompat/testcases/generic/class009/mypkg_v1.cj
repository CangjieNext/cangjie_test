// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public open class Eq<T> {
	func eq(other: T): Bool {
		true
	}
}

public class Ord<T> <: Eq<T> {
	func lt(other: T): Bool {
		true
	}
}

public class Foo<T> where T <: Eq<T> {
	public func foo(a: Int64) {
		0
	}
}