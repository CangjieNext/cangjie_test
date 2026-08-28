// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V5
public open class Base {}
public open class Sub <: Base {}

// 场景五：将函数f1的k参数类型改为Base，为API兼容，但ABI不兼容，因为该函数的mangle name发生了变换，若不重新编译会导致链接错误
public class Foo {
     func f1(x: Int64, z!: Int64, y!: Int64 = 3, k!: Base): Int64 {
        return 1
    }
    @Frozen
    public func f2(): Int64 { f1(1, z:2, y:3, k:Sub()) }
}
