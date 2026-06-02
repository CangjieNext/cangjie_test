// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test0

public open class A {
    public open func foo(): Int64 {
        return 3
    }
    public func goo() {
        return 2
    }
}

public class B<T> <: A {
    public override func foo(): Int64 {
        return 2
    }
}
