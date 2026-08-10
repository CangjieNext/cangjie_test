// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V11
public open class Base {}
public open class Sub <: Base {}

// 将主构造函数S1的k参数类型改为Int64，为API和ABI均不兼容
public struct S1 {
    public S1(x: Int64, z!: Int64, y!: Int64 = 3, k!: Int64) {
    }
}
