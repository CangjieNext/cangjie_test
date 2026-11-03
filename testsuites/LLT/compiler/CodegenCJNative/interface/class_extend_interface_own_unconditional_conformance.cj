// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// An unconditional extension of the type itself dominates an ancestor's conditional conformance to
// the same interface: the type conforms for every type argument, and virtual dispatch through the
// interface must work for an instance whose argument satisfies only the ancestor's condition.

interface I {
    func f(): Int64
}

interface C1 {}

open class A<T> {
    public open func f(): Int64 {
        1
    }
}

extend<T> A<T> <: I where T <: C1 {}

class B<U> <: A<U> {}

extend<U> B<U> <: I {}

class Bad {}

main(): Int64 {
    // Bad does not satisfy C1, but B's own extension is unconditional.
    let value: Object = B<Bad>()
    if (!(value is I)) {
        return 1
    }
    // Dispatch through the interface reaches A.f, as B does not override it.
    let i: I = B<Bad>()
    if (i.f() != 1) {
        return 2
    }
    return 0
}
