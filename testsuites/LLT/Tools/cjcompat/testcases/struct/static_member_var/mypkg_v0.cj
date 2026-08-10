// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA


public interface I {}

extend Int32 <: I {}

public open class Base {}
public open class Sub <: Base {}

public struct Foo {
    public static var classLike: Base = Sub()
    public static let primaryVar: I = Int32(52)
}