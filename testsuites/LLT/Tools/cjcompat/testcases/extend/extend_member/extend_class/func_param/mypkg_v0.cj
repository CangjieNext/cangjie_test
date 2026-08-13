// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

open public class TestClass {
    public const init() {}
}
extend TestClass {
    private const func f1(a!:Int64 = 1): Int64 {
        return 1
    }
    public const func f2(a!:Int64 = 1): Int64 {
        f1()
    }
    internal const func f3(): Int64 {
        return 3
    }
    protected const func f4(a!:Int64 = 1): Int64 {
        f3()
    }

    func f5(): Int64 {
        return 5
    }
    @Frozen
    public func f6(a!:Int64 = 1): Int64 {
        f5()
    }
}