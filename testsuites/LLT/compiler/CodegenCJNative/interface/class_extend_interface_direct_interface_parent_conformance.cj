// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %output

// When a class directly declares an interface that was already collected from an ancestor's
// conditional extension, the direct declaration is unconditional. The unconditional conformance must
// also be propagated to the parent interfaces of that interface.

interface I {}

interface J <: I {}

interface C {}

open class A<T> {}

extend<T> A<T> <: J where T <: C {}

class B<U> <: A<U> & J {}

class Bad {}

main() {
    let value: Object = B<Bad>()
    if (!(value is J)) {
        return 1
    }
    if (!(value is I)) {
        return 2
    }
    return 0
}
