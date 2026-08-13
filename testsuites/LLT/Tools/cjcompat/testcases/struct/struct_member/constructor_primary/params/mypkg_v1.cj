// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public open class Base {}
public open class Sub <: Base {}

// 将主构造函数S1的x参数改名为m，为API+ABI兼容
public struct S1 {
    public S1(m: Int64, z!: Int64, y!: Int64 = 3, k!: Sub) {
    }
}