// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// A type can conform to one interface through several conformance paths: an extension of an
// ancestor and an extension of the type itself. The paths are alternatives, so satisfying the
// condition of either one implements the interface; the runtime must not require both.

interface I {}

interface C1 {}

interface C2 {}

open class A<T> {}

extend<T> A<T> <: I where T <: C1 {}

class B<U> <: A<U> {}

extend<U> B<U> <: I where U <: C2 {}

class OnlyC2 <: C2 {}

class Both <: C1 & C2 {}

main(): Int64 {
    // OnlyC2 does not satisfy the ancestor's C1, but satisfies the type's own C2.
    let onlyC2: Object = B<OnlyC2>()
    if (!(onlyC2 is I)) {
        return 1
    }
    let both: Object = B<Both>()
    if (!(both is I)) {
        return 2
    }
    // Int64 satisfies neither condition, so B<Int64> conforms to no path.
    let neither: Object = B<Int64>()
    if (neither is I) {
        return 3
    }
    return 0
}
