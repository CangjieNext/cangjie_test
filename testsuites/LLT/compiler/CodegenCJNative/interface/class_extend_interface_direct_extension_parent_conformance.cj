// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %output

// A class can implement an interface directly through an extension while an ancestor conditionally
// implements another interface that inherits the same parent. The direct extension is unconditional,
// so the parent interface must also be reported as implemented even when the ancestor condition does
// not hold. The extension's own entry must not be shadowed by the inherited conditional entry.

interface I {}

interface J1 <: I {}

interface J2 <: I {}

interface C {}

open class A<T> {}

extend<T> A<T> <: J1 where T <: C {}

class B<U> <: A<U> {}

extend<U> B<U> <: J2 {}

class Bad {}

main() {
    let value: Object = B<Bad>()
    if (!(value is J2)) {
        return 1
    }
    if (!(value is I)) {
        return 2
    }
    return 0
}
