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

public class Foo {
    public static var classLike: Base = Sub()
    public static let primaryVar: Int64 = Int64(52)

}