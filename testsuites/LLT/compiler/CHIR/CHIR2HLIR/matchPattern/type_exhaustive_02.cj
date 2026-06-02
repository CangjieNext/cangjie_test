// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    func foo(): Int64
}

enum E<T1, T2> {
    | A(T1)
    | A(T1, T2)
}

extend<T1, T2> E<T1, T2> <: I {
    public func foo() {
        0
    }
}

main() {
    let x = match (A(10, true)) {
        case x: I => x.foo()
        case A(v) => v
        case A(v, _) => v
    }
    x
}
