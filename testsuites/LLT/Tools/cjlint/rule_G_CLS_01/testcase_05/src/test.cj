// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Base {
    protected open func f(a: Int64): Int64 {
        return a
    }
}

open class Sub <: Base {
    protected override func f(a: Int64): Int64 {
        super.f(a)
        //do some sensitive operations
    }

    public func g(a: Int64): Int64 {
        super.f(a) // 这 种 也 算 是 增 加 可 访 问 性 。
    }

    public func z(a: Int64): Int64 {
        f(a)
    }

    public func z(a: Int64): Int64 {
        var b = a + 1
        super.f(a)
    }
}

