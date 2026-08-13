// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public open class Base {}
public open class Sub <: Base {}

// 新增函数参数，为API+ABI均不兼容
public class Foo {
    public init(x: Int64, x1: Int32, z!: Int64, y!: Int64 = 3, k!: Sub) {
    }
}
