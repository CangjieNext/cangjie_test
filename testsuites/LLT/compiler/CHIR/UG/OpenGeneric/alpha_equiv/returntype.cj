// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %cmp_opt %compile_lib_opt

open class A<T> {
    public open func foo<S>(_: S): A<T> {
        A<T>()
    }
}

class B<T> <: A<T> {
    public override func foo<L>(_: L): B<T> {
        println(3)
        B<T>()
    }
}
