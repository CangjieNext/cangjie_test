// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V6
public open class Base {}
public open class Sub <: Base {}

// 场景六：将函数f1的z参数增加默认值z!: Int64 = 4，为API+ABI均兼容
public class Foo {
    public static func f1(x: Int64, z!: Int64 = 4, y!: Int64 = 3, k!: Sub): Int64 {
        return 1
    }
}
