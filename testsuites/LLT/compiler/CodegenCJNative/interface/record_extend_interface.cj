// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface Eqq {
    func foo(): Int64 {
        0
    }
}

struct R<T> {
    public func add(): Int64 {
        return 1
    }
}

extend<T> R<T> {}

extend<T> R<T> <: Eqq {
    public func foo(): Int64 {
        add()
    }
}

main() {
    let a: Eqq = R<Int64>();
    return a.foo() - 1
}
