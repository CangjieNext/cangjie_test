// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public interface Eq<T> {
	func eq(other: T): Bool
}

public class Foo<T> {
    public func foo<T>(a: T) {
        a
    }
}
extend<T> Foo<T> where T <: Eq<T> {
    public func equals() {
        true
    }
}