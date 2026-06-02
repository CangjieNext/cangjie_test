/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
open class A {}

open class B <: A {}

open class C <: B {}

open class D <: C {}

open class E <: D {}

func f<X>(a: X) where X <: A {
    0
}

func f<Y>(a: Y) {
    1
}

main() {
    f(E())
}
// ASSERT: scan sema_overload_conflicts
