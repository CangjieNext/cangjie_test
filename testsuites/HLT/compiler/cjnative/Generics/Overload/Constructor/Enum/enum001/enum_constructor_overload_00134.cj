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

open class C <: A {}

open class E <: C {}

open class B {}

open class D <: B {}

open class F <: D {}

enum X {
    a((A, D))
}

enum Y {
    a((C, B))
}

main(): Int64 {
    var j = a((E(), F()))
    return 1
}
// ASSERT: scan sema_multiple_constructor_in_enum
