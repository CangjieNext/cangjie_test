// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %f %cmp_opt %compile_lib_opt

open class A<T> {
    public open func foo<S>(): A<T> {
        A<T>()
    }
    public open func bar(): A<T> {
        A<T>()
    }
}

class B<T> <: A<T> {
    public override func foo(): A<T> {
        println(3)
        B<T>()
    }
    public override func bar<S>(): A<T> {
        println(3)
        B<T>()
    }
}

// ASSERT: scan 'override' function 'foo' does not have an overridden function in its supertype
// ASSERT: scan 'override' function 'bar' does not have an overridden function in its supertype
