// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

class C1<T> {}

struct S1 {}

open class I<T> {
    public open func foo(a: C1<T>) {
        return 1
    }
}

class A <: I<S1> {
    public func foo(a: C1<S1>) {
        return 0
    }
}

main() {
    0
}
