/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {}

interface B <: A {}

interface C <: A {}

open class D <: B & C {}

open class E <: D {}

func f<X>(a: X) where X <: A {
    1
}

func f<X>(a: X) where X <: B {
    1
}

func f<X>(a: X) where X <: C {
    1
}

func f<X>(a: X) where X <: D {
    0
}

main() {
    f(E())
}
// ASSERT: scan sema_overload_conflicts
