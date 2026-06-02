// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

open class I {
    public open func foo() {
        return 1
    }
}

open class A<T> <: I {
    let a: T
    public open func foo() {
        var b = a
        return 0
    }
    init(x: T) {
        a = x
    }
}

class B <: A<Bool> {
    init() {
        super(true)
    }
}

main() {
    var a: I = B()
    a.foo()
}
