// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

struct SA {
    var x = 2
}

open class C<T> {
    public open func foo(param1: T, param2: SA): SA {
        SA()
    }
}

class D <: C<SA> {
    public func foo(param1: SA, param2: SA): SA {
        SA()
    }
}

main() {
    C<Unit>().foo((), SA()).x - 2 + D().foo(SA(), SA()).x - 2
}
