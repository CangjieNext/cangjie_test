// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 111

class A<T> {}

open class CA<T> {
    public open func foo(a: T) {
        println(0)
        return 1
    }
    public open func foo(a: A<T>) {
        println(111)
    }
    public func goo(a: A<T>) {
        foo(a)
    }
}

main() {
    var x = CA<Bool>()
    x.goo(A<Bool>())
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
