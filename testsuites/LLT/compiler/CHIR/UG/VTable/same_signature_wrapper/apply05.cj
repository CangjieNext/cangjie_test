// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

class CA {
    var x = 2
}

struct SA {}

open class C<T> {
    let x: T
    init(a: T) {
        x = a
    }
    public open func foo(param1: T, param2: SA): T {
        x
    }
}

open class D <: C<CA> {
    init() {
        super(CA())
    }
    public func foo(param1: CA, param2: SA): CA {
        CA()
    }
}

class E <: D {
    // use foo_withTI declared in class D
}

main() {
    E().foo(CA(), SA()).x - 2
}
