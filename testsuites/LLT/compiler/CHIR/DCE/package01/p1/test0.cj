// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test0

public open class A<T> {
    public func Foo(a: T) {
        return 1
    }
    public func goo(b: T) {
        Foo(b)
        return 2
    }
}
