// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %output

// Two conditional extensions can implement different child interfaces of the same parent. The
// conformance paths are alternatives: satisfying either child interface is enough to implement the
// parent, and the runtime condition must not require the conditions of both paths simultaneously.

interface I {}

interface J1 <: I {}

interface J2 <: I {}

interface C1 {}

interface C2 {}

open class A<T> {}

extend<T> A<T> <: J1 where T <: C1 {}

extend<T> A<T> <: J2 where T <: C2 {}

class B<U> <: A<U> {}

class OnlyC2 <: C2 {}

main() {
    let value: Object = B<OnlyC2>()
    if (!(value is J2)) {
        return 1
    }
    if (!(value is I)) {
        return 2
    }
    if (value is J1) {
        return 3
    }
    return 0
}
