// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V8
public open class Base {}
public open class Sub <: Base {}

// 场景八：将函数f1的y参数默认值修改为其他值，为API+ABI均兼容
public class Foo {}

extend Foo {
    static func f1(x: Int64, z!: Int64, y!: Int64 = 5, k!: Sub): Int64 {
        return 1
    }
    @Frozen
    public static func f2(): Int64 { f1(1, z:2, y:3, k:Sub()) }
}
