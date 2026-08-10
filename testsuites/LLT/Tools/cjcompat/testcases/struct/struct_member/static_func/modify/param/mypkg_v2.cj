// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V2
public open class Base {}
public open class Sub <: Base {}

// 场景二：将函数f1的y参数改名为m，为API+ABI不兼容，因为下游包的使用处对命名参数的传参无法编译通过
public struct Foo {
    public static func f1(x: Int64, z!: Int64, m!: Int64 = 3, k!: Sub): Int64 {
        return 1
    }
}
