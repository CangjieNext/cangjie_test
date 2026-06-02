// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %f %cmp_opt

open class A<T> {
    public open func foo<S>(a: Int64) {
    }
}

class B<T> <: A<T> {
    public override func foo<S>(a: Int32) {
        println(3)
    }
}

main() {
}

// ASSERT: scan 'override' function 'foo' does not have an overridden function in its supertype
