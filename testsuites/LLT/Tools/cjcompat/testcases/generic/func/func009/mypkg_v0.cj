// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
interface Eq<T> {
	func eq(other: T): Bool
}

func foo<T>(a: T) where T <: Eq<T> {
	a.eq(a)
    0
}