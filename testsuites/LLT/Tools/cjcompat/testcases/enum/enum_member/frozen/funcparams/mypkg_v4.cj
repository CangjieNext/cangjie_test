// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V4
public open class Base {}
public open class Sub <: Base {}

// 场景四：将函数f1的z参数改为非命名参数z: Int64，为API+ABI均不兼容，因为下游包的使用处对z的传参无法编译通过
public enum Foo {
    A
    func f1(x: Int64, z: Int64, y!: Int64 = 3, k!: Sub): Int64 {
        return 1
    }
    @Frozen
    public func f2(): Int64 { f1(1, 2, y:3, k:Sub()) }
}
